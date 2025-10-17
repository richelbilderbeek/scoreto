#' Get the InfraViz courses website as HTML
#' @seealso use \link{get_test_infraviz_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_infraviz_html <- function() {
  readr::read_lines(scoreto::get_infraviz_courses_url())
}
