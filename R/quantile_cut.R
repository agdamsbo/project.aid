#' Easy function for splitting numeric variable in quantiles
#'
#' Using base/stats functions cut() and quantile().
#'
#' @param x Variable to cut.
#' @param groups Number of groups of equal size.
#' @param probs Supply exact probs directly to 'quantile()' for clusters of
#' different sizes. If provided, then group is ignored. Default is NULL.
#' @param y alternative vector to draw quantile cuts from. Limits has
#' to be within x. Default is NULL.
#' @param na.rm Remove NA's. Default is TRUE.
#' @param group.names Names of groups to split to. Default is NULL,
#' giving intervals as names.
#' @param ordered.f Set resulting vector as ordered. Default is FALSE.
#' @param detail.list flag to include details or not
#' @param inc.outs Flag to include min(x) and max(x)
#' as borders in case of y!=NULL.
#' @param right logical, indicating if the intervals should be closed on the
#' right (and open on the left) or vice versa (used in 'cut()').
#'
#' @return vector or list with vector and details (length 2)
#'
#' @keywords quantile
#' @importFrom stats quantile
#' @export
#' @examples
#' aa <- as.numeric(sample(1:1000, 2000, replace = TRUE))
#' x <- 1:450
#' y <- 6:750
#' summary(quantile_cut(aa, groups = 4, detail.list = FALSE)) ## Cuts quartiles
#' summary(quantile_cut(aa, probs = c(0, .2, .5), detail.list = FALSE))
quantile_cut <- function(x,
                         groups,
                         y = NULL,
                         na.rm = TRUE,
                         group.names = NULL,
                         ordered.f = FALSE,
                         inc.outs = FALSE,
                         detail.list = FALSE,
                         probs = NULL,
                         right=TRUE) {
  if (!is.null(probs)) {
    fractions <- probs
  } else {
    fractions <- seq(0, 1, 1 / groups)
  }

  if (!is.null(y)) {
    q <- stats::quantile(
      x = y,
      probs = fractions,
      na.rm = na.rm,
      names = TRUE,
      type = 7
    )
    if (inc.outs) {
      # Setting cut borders to include outliers in x compared to y.
      q[1] <- min(x, na.rm = TRUE)
      q[length(q)] <- max(x, na.rm = TRUE)
    }
  }
  if (is.null(y)) {
    q <- stats::quantile(
      x = x,
      probs = fractions,
      na.rm = na.rm,
      names = TRUE,
      type = 7
    )
  }
  d <- cut(
    x = x,
    breaks = q,
    include.lowest = TRUE,
    labels = group.names,
    ordered_result = ordered.f,
    right=right
  )
  if (detail.list) {
    list(d, q)
  } else {
    d
  }
}
