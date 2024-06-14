#' Merge scripts to single file. Handy for shinylive apps
#'
#' @param files files to merge. Use list.files().
#' @param dest destination path
#' @param strip.roxygen optionally remove roxygen comment lines
#'
#' @return NULL
#' @export
#'
merge_scripts <- function(files,dest,strip.roxygen=TRUE){
  sink(dest)

  for(i in seq_along(files)){
    current_file <-  readLines(files[i])

    if (strip.roxygen){
      current_file <- sub("(?m)^\\#\\'.*\n?", "", current_file, perl=T)
    }

    cat("\n\n########\n#### Current file:",files[i],"\n########\n\n")
    cat(current_file, sep ="\n")
  }
  sink()
}
