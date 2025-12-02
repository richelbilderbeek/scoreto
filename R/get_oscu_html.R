#' Get the OSCU events website as HTML
#' @seealso use \link{get_test_oscu_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_oscu_html <- function() {
  readr::read_lines(scoreto::get_oscu_events_url())
}
