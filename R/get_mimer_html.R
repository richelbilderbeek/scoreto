#' Get the Mimer events website as HTML
#' @seealso use \link{get_test_mimer_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_mimer_html <- function() {
  readr::read_lines(scoreto::get_mimer_courses_url())
}
