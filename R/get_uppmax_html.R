#' Get the UPPMAX courses website as HTML
#' @return HTML text
#' @export
get_uppmax_html <- function() {
  # Cannot use the pretty rendered source at
  # https://docs.uppmax.uu.se/courses_workshops/courses_workshops/
  # because it cannot be read
  uppmax_url <- paste0(
    "https://raw.githubusercontent.com/",
    "UPPMAX/UPPMAX-documentation/refs/heads/main/",
    "docs/courses_workshops/courses_workshops.md"
  )
  readr::read_lines(uppmax_url)
}
