#' Get a table of all the HPC storage systems and the center(s) these
#' are connected to.
#'
#' @return a table with all HPC storage systems and the center(s) these
#' are connected to, sorted alphabetically by HPC storage system name
#' @export
get_storage_to_center <- function() {
  readr::read_csv(
    get_scoreto_path("storage_to_center.csv"),
    show_col_types = FALSE
  )
}
