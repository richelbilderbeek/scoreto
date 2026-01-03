#' Get testing HTML of the PDC courses website
#' @seealso use \link{get_pdc_html} to get HTML text read from the
#' PDC courses website
#' @return HTML text
#' @export
get_test_pdc_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("pdc_no_events.html"))
}
