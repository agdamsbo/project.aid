#' Create symmetrical tics for a log scale based on sequence
#'
#' @param data numeric vector
#' @param dec decimals
#'
#' @return numeric vector
#' @export
#'
#' @examples
#' log_tics(c(.5,1,5))
log_tics <- function(data,dec=2) {
  sort(round(unique(c(1 / data, data)), dec))
}
