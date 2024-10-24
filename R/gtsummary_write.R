#' Small wrapper to export table with 'gt'
#'
#' @param data gtsummary object
#' @param path output path. Format follows file extension in path.
#' @param ... passed on to gt::gtsave
#'
#' @return NULL
#' @export
#'
#' @examples
#' # gtsummary::trial |> gtsummary::tbl_summary() |> gtsummary2docx()
gtsummary_write <- function(data, path,...) {
  data |>
    gtsummary::as_gt() |>
    gt::gtsave(path = path,...)
}
