#' Deploy the Shiny app with rsconnect to shinyapps.io
#'
#' @description
#' This is really just a simple wrapper
#'
#' @param path app folder path
#' @param files files in folder path to deploy
#' @param account.name shinyapps account name
#' @param name.app name of deployed app
#' @param name.token stored name of token
#' @param name.secret stored name of secret
#'
#' @return deploy
#' @export
deploy_shiny <- function(path = here::here("app/"),
                         files=NULL,
                         account.name,
                         name.app = "shiny_cast",
                         name.token,
                         name.secret) {
  # Connecting
  rsconnect::setAccountInfo(
    name = account.name,
    token = keyring::key_get(service = name.token),
    secret = keyring::key_get(service = name.secret)
  )

  # Deploying
  rsconnect::deployApp(appDir = path, appFiles = files, lint = TRUE, appName = name.app)
}
