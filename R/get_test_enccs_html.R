#' Get testing HTML of the ENCCS courses website
#' @seealso use \link{get_enccs_html} to get HTML text read from the
#' ENCCS courses website
#' @return HTML text
#' @export
get_test_enccs_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("enccs.html"))
}
