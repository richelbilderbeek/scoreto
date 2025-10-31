#' Get testing HTML of the Code Refinery courses website
#' @seealso use \link{get_code_refinery_html} to get HTML text read from the
#' Code Refinery courses website
#' @return HTML text
#' @export
get_test_code_refinery_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("code_refinery.html"))
}
