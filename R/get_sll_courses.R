#' Get the SciLifeLab courses
#' @return a table with all SciLifeLab courses
#' @export
get_sll_courses <- function() {
  html <- rvest::read_html("https://training.scilifelab.se/events")
  html
}
