#' Get the HPC2N courses website as HTML
#' @seealso use \link{get_test_slubi_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_slubi_html <- function() {
  readr::read_lines(scoreto::get_slubi_courses_url())
}
