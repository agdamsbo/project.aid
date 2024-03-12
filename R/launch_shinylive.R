#' Generate and launch shinylive instance
#'
#' @param app.dir dir to app
#' @param dest.dir destination dir
#'
#' @return shinylive app
#' @export
#'
launch_shinylive <- function(app.dir = here::here("app/"), dest.dir = here::here("docs/")) {
  shinylive::export(appdir = app.dir, destdir = dest.dir)

  httpuv::runStaticServer(dir = dest.dir)
}
