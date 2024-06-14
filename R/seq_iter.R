#' Iteratively expand sequence for looped subsetting
#'
#'
#' @param i iteration
#' @param n sequence size
#'
#' @return numeric vector
#' @export
#'
#' @examples
#' for (i in 1:2) print(seq_iter(i, 5))
seq_iter <- function(i, n) {
  seq((i - 1) * n + 1, i * n)
}
