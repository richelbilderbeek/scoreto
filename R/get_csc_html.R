#' Get the CSC courses website as HTML
#' @seealso use \link{get_test_csc_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_csc_html <- function() {
  readr::read_lines(scoreto::get_csc_courses_url())
}
