#' Get the SciLifeLab courses website as HTML
#' @seealso use \link{get_test_sll_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_sll_html <- function() {
  readr::read_lines(scoreto::get_sll_courses_url())
}
