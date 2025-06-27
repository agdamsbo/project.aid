#' Functionalised character vector of all labels
#'
#' @description
#' This just serves as a template.
#'
#'
#' @return vector of named labels
#' @export
#'
#' @examples
#' var_labels()
var_labels <- function() {
  c(
    mpg = "Miles per gallon",
    cyl = "Cylinders"
  )
}

#' Retrieved matched values
#'
#' @param data data
#' @param target target to match against and subset from
#'
#' @return character vector
#' @export
#'
get_match <- function(data, target) {
  if (!is.null(names(target))) {
    out <- target[match(data, names(target))]
  } else {
    out <- data
  }
  unname(out)
}

#' Flexible labelling based on named vector.
#'
#' @description
#' Uses column name if label is missing.
#'
#' @param data data set
#' @param label.vec vector of named character strings, with names being column
#' names.
#' @param overwrite overwrite existing labels. Default is TRUE
#'
#' @return data.frame/tibble with labels
#' @export
#'
#' @examples
#' mtcars |>
#'   apply_labels() |>
#'   sapply(attributes) |>
#'   unlist()
apply_labels <- function(data, label.vec = var_labels(), overwrite = TRUE) {
  labs <- get_match(names(data), label.vec)
  labs[is.na(labs) | labs == ""] <- names(data)[is.na(labs) | labs == ""]

  purrr::map2(data, labs, \(.x, .y){
    if (overwrite | is.null(attr(x = .x, which = "label"))) {
      attr(x = .x, which = "label") <- .y
    }
    .x
  }) |> dplyr::bind_cols()
}
