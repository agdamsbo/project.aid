
#' Search for child dependencies in package dependencies
#'
#' @param packages character string of packages to search for
#'
#' @return
#' @export
#'
#' @examples
#' check_dependencies(packages = c("curl"))
#' check_dependencies()|>purrr::list_c() |> unique() |> sort()
check_dependencies <- function(path=here::here(""),packages = NULL) {
  sorted_unique <- function(data){sort(unique(data))}

  parents <- sorted_unique(renv::dependencies(path = path)[["Package"]])

  parents |>
    lapply(tools::package_dependencies) |>
    purrr::flatten() |>
    (\(.x){
      filt <- lapply(.x, match, packages) |>
        lapply(function(.y) {
          !all(is.na(.y))
        }) |>
        purrr::list_c()

      if (is.null(packages)){
        .x
      } else {
        .x[filt | parents %in% packages]
      }
    })()
}
