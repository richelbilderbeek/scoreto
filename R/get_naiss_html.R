#' Get the NAISS courses website as HTML
#' @return HTML text
#' @export
get_naiss_html <- function() {
  readr::read_lines(scoreto::get_naiss_courses_url())
}
