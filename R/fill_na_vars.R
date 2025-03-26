#' Combine variables to fillmissing values
#'
#' @description
#' Export the first non-NA value for each cell in rowwise fashion
#'
#'
#' @param ... a prioritised selection of vectors/variables of same length
#'
#' @returns vector
#' @export
#'
#' @examples
#' fill_na_vars(c(1:3,NA,NA),c(2,NA,3:5))
fill_na_vars <- function(...){
  ls <- list(...)
  if (!length(unique(lengths(ls)))==1){
    stop("Please provide elements of equal length")
  }

  apply(dplyr::bind_cols(ls,.name_repair = "unique_quiet"),1,
        \(.x){
          if (all(is.na(.x))){
            NA
          } else {
            .x[min(which(!is.na(.x)))]
          }
        })
}
