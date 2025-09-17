#' Get the HPC2n courses website as HTML
#' @seealso use \link{get_test_hpc2n_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_hpc2n_html <- function() {
  readr::read_lines(scoreto::get_hpc2n_courses_url())
}
