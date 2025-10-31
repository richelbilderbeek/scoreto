#' Get testing HTML of the HPC2N courses website
#' @seealso use \link{get_slubi_html} to get HTML text read from the
#' SLUBI courses website
#' @return HTML text
#' @export
get_test_slubi_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("slubi.html"))
}
