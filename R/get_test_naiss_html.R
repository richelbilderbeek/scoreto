#' Get testing HTML of the NAISS courses website
#' @seealso use \link{get_naiss_html} to get HTML text read from the
#' NAISS courses website
#' @return HTML text
#' @export
get_test_naiss_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("naiss.html"))
}
