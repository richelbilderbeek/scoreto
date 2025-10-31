#' Get the ENCCS courses website as HTML
#' @seealso use \link{get_test_enccs_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_enccs_html <- function() {
  # Cannot use the pretty rendered source at
  # https://docs.enccs.uu.se/courses_workshops/courses_workshops/
  # because it cannot be read
  readr::read_lines(scoreto::get_enccs_courses_url())
}
