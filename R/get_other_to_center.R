#' Get a table of all the others and the center(s) these
#' are connected to.
#'
#' @return a table with all others and the center(s) these
#' are connected to, in tidy data format,
#' sorted alphabetically by (1) other name,
#' (2) center name
#' @export
#' @examples
#' get_other_to_center()
get_other_to_center <- function() {
  readr::read_csv(
    get_scoreto_path("other_to_center.csv"),
    show_col_types = FALSE
  )
}
