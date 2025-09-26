#' Obscure or offset numeric vector by a random number within a given interval
#'
#' @param data numeric vector
#' @param dif difference to offset original
#'
#' @returns numeric vector
#' @export
#'
#' @examples
#' obscure_number(1:10)
#' # obscure_number(letters[1:10])
#' # obscure_number(1:10,1:2)
obscure_number <- function(data,dif=3){
  if (!is.numeric(dif) || length(dif)>1){
    stop("The supplied difference has to be numeric of length 1")
  }

  if (!is.numeric(data)){
    stop("This function only supports numeric vectors")
  }
    data + sample(c(-dif:dif),size=length(data),replace=T)
}
