#' Get testing HTML of the NSC courses website
#' @seealso use \link{get_nsc_html} to get HTML text read from the
#' NSC courses website
#' @return HTML text
#' @export
get_test_nsc_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("nsc.html"))
}
