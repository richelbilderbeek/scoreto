#' Get testing HTML of the InfraViz courses website
#' @seealso use \link{get_infraviz_html} to get HTML text read from the
#' InfraViz courses website
#' @return HTML text
#' @export
get_test_infraviz_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("infraviz.html"))
}
