#' Splits sequence in n groups of equal size or groups of max l
#'
#' @param sequence vector
#' @param n number of groups. Ignored if l is specified.
#' @param l max length of groups
#' @param split.labels optional label for groups
#'
#' @return list
#' @export
#'
#' @examples
#' split_seq(1:8, l = 3)
split_seq <- function(sequence, n = NULL, l = NULL, split.labels = NULL) {
  if (!is.null(l)) n <- ceiling(length(sequence) / l)

  if (is.null(split.labels)) split.labels <- paste0("g",seq_len(n))

  split(
    sequence,
    cut(seq_along(sequence),
        breaks = n,
        labels = split.labels
    )
  )
}
