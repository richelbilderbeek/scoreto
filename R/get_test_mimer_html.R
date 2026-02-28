#' Get testing HTML of the Mimer courses website
#' @seealso use \link{get_mimer_html} to get HTML text read from the
#' Mimer courses website
#' @return HTML text
#' @export
get_test_mimer_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("mimer_20260225.html"))
}
