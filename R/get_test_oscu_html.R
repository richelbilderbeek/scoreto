#' Get testing HTML of the OSCU courses website
#' @seealso use \link{get_oscu_html} to get HTML text read from the
#' OSCU courses website
#' @return HTML text
#' @export
get_test_oscu_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("oscu.html"))
}
