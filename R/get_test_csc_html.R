#' Get testing HTML of the CSC courses website
#' @seealso use \link{get_csc_html} to get HTML text read from the
#' CSC courses website
#' @return HTML text
#' @export
get_test_csc_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("csc.html"))
}
