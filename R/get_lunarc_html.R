#' Get the LUNARC courses website as HTML
#' @seealso use \link{get_test_lunarc_html} to get similar HTML text to be
#' used in testing
#' @return HTML text
#' @export
get_lunarc_html <- function() {
  readr::read_lines(get_lunarc_courses_url())
}
