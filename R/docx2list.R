utils::globalVariables(c("cell_id", "content_type", "is_header", "row_id"))
#' Reads docx file and splits each element into list
#'
#' @description
#' If now header row is defined in a table, the first row will be used for
#' column names.
#' Specified handling of "table cell" and "paragraph" data types. Others are
#' just passed.
#' Attempts to handle merged cells, but try to avoid.
#'
#' Inspiration from `https://www.r-bloggers.com/2020/07/how-to-read-and-create-word-documents-in-r/`
#'
#' @param path file path
#' @param data.type optional character vector to filter content. Could be
#' "paragraph" or "table cell".
#' @param verbose flag to give a little information on the data
#'
#' @return list
#' @export
docx2list <- function(path,
                      data.type = "table cell",
                      verbose = FALSE) {
  doc <- officer::read_docx(path)

  content <- doc |> officer::docx_summary()

  if (verbose) {
    message("Content types in the current document are as follows:")
    print(content$content_type |> unique())
  }

  if (is.null(data.type)) {
    elements <- content
  } else {
    elements <- content |> dplyr::filter(content_type %in% data.type)
  }

  split(elements, elements$doc_index) |> purrr::map(function(.x) {
    type <- .x |>
      dplyr::slice(1) |>
      dplyr::pull(content_type)

    if (type == "table cell") {
      table_data <- .x |>
        dplyr::filter(!is_header) |>
        dplyr::select(row_id, cell_id, text)

      # split data into individual columns
      splits <- split(table_data, table_data$cell_id)
      splits <- lapply(splits, function(.y) .y$text)
      splits <- splits |>
        purrr::keep(function(.y) length(.y) > 1)

      # If a footer has been added, it is considered part of the first column,
      # and will result in unequal col lengths.
      # This solution does not handle merged cells
      col_lengths <- lengths(splits)

      if (col_lengths[1] > col_lengths[2]) {
        splits[[1]] <- splits[[1]][seq_len(col_lengths[2])]
      }

      # combine columns back together in wide format
      table_result <- splits |>
        dplyr::bind_cols()

      # get table headers
      cols <- .x |> dplyr::filter(is_header)

      if (nrow(cols) == 0) {
        # I no header is present, first row is used
        cols <- .x |> dplyr::filter(row_id == 1)
        table_result <- table_result |> dplyr::slice(-1)
      }

      names(table_result) <- tolower(gsub(" ", "_", cols$text))
      out <- table_result
    } else if (type == "paragraph") {
      # Paragraph handling
      out <- .x |> dplyr::pull(text)
    } else {
      # Other data types are just passed through
      out <- .x
    }

    class(out) <- c(paste0("docs_", type), class(out))
    out
  })
}
