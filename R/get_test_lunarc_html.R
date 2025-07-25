#' Get testing HTML of the LUNARC courses website
#' @seealso use \link{get_lunarc_html} to get HTML text read from the
#' LUNARC courses website
#' @return HTML text
#' @export
get_test_lunarc_html <- function() {
  readr::read_lines(get_scoreto_path("lunarc.html"))
}
