#' Get a table with all of the providers' information
#'
#' @return a table with all providers' information,
#' @export
get_all_providers_info <- function() {
  readr::read_csv(
    scoreto::get_scoreto_path("providers_info.csv"),
    show_col_types = FALSE
  )
}
