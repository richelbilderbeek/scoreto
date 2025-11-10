#' Get the NAISS courses website as HTML
#' @seealso use \link{get_test_naiss_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_naiss_html <- function() {
  readr::read_lines(scoreto::get_naiss_courses_url())
}
