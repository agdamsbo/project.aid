#' Extension of base::combn() to get all permutations of group size(s) m
#'
#' @description
#' A few notes on the math and calculating possible options:
#' https://math.stackexchange.com/a/2339815
#'
#'
#' @param data data
#' @param m group size(s). Numeric vector of length 1:length(data).
#' @param perm logical to include all group sizes from 1:m. If m is missing
#' 1:length(data).
#' @param force logical to force complete combinations
#' @param limit warning limit of large number of permutations
#'
#' @returns list
#' @export
#'
#' @examples
#' combn_perm(1:3, 1)
#' combn_perm(1:4, 2)
#' combn_perm(1:4, c(1, 2, 4), perm = TRUE)
#' combn_perm(1:10, c(1, 2, 4), perm = FALSE)
#' combn_perm(letters[1:4], perm = TRUE)
#' rownames(mtcars) |>
#'   combn_perm(2) |> length()
#' \dontrun{
#' rownames(mtcars) |>
#'   combn_perm(2,limit=100)
#' }
combn_perm <- function(data, m, perm = FALSE, force = FALSE, limit = 1e+6) {
  if (is.data.frame(data)) {
    data <- data[[1]]
  }

  if (isTRUE(perm) & missing(m)) {
    seq_m <- seq_along(data)
  } else if (missing(m)) {
    stop("When 'perm' is FALSE a value for m is needed.")
  } else if (isTRUE(perm)) {
    seq_m <- seq_len(max(m))
  } else {
    seq_m <- m
  }

  if (!isTRUE(force)) {
    output_length <- (factorial(length(data)) / (factorial(max(seq_m)) * factorial(length(data) - max(seq_m))))

    if (output_length > limit) {
      stop(glue::glue("
      Quick estimate have the output exceeding {limit} combinations.
      To proceed, rerun with flag 'force' set to TRUE.
      This may result in a sustem crash, and at least very time consuming calculations."
                      ))
    }
  }
# browser()
  seq_m |>
    lapply(\(.x){
      # browser()
      combn(data, m = .x) |>
        as.data.frame() |>
        as.list()
    }) |>
    purrr::list_flatten() |>
    stats::setNames(NULL)
}
