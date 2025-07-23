#' Get a table of all the web_hosts and the center(s) these
#' are connected to.
#'
#' @return a table with all web_hosts and the center(s) these
#' are connected to, in tidy data format,
#' sorted alphabetically by (1) web_host name,
#' (2) center name
#' @export
#' @examples
#' get_web_host_to_center()
get_web_host_to_center <- function() {
  readr::read_csv(
    get_scoreto_path("web_host_to_center.csv"),
    show_col_types = FALSE
  )
}
