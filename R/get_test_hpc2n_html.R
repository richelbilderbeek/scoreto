#' Get testing HTML of the HPC2n courses website
#' @seealso use \link{get_hpc2n_html} to get HTML text read from the
#' HPC2N courses website
#' @return HTML text
#' @export
get_test_hpc2n_html <- function() {
  readr::read_lines(scoreto::get_scoreto_path("hpc2n.html"))
}
