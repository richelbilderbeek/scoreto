#' Get the SciLifeLab courses website as HTML
#' @return HTML text
#' @export
get_sll_html <- function() {
  readr::read_lines(scoreto::get_sll_courses_url())
}
