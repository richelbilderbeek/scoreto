#' Get the HPC2N courses website as HTML
#' @return HTML text
#' @export
get_hpc2n_html <- function() {
  readr::read_lines(scoreto::get_hpc2n_courses_url())
}
