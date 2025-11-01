#' Get testing HTML of the SciLifeLab courses website
#' @seealso use \link{get_sll_html} to get HTML text read from the
#' SLUBI courses website
#' @return HTML text
#' @export
get_test_sll_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("sll.html"))
}
