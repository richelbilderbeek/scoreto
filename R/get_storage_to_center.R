#' Get a table of all the HPC storage systems and the center(s) these
#' are connected to.
#'
#' @return a table with all HPC storage systems and the center(s) these
#' are connected to, in tidy data format,
#' sorted alphabetically by (1) HPC storage system name,
#' (2) HPC center name
#' @export
#' @examples
#' get_storage_to_center()
get_storage_to_center <- function() {
  readr::read_csv(
    get_scoreto_path("storage_to_center.csv"),
    show_col_types = FALSE
  )
}
