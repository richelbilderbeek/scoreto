#' Get the C3SE courses as HTML
#' @param c3se_training_url the URL of the C3SE training webpage
#' @return the HTML text of the C3SE courses.
#' @seealso use \link{get_c3se_courses} to get the C3SE courses as a table.
#' @export
get_c3se_html <- function(
  c3se_training_url = scoreto::get_provider_courses_url("C3SE")
) {
  readr::read_lines(c3se_training_url)
}
