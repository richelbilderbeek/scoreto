#' Get the PDC courses as HTML
#' @param pdc_training_url the URL of the PDC training webpage
#' @return the HTML text of the PDC courses.
#' @seealso use \link{get_pdc_courses} to get the PDC courses as a table.
#'   Use \link{get_test_pdc_html} to get testing HTML.
#' @export
get_pdc_html <- function(pdc_training_url = scoreto::get_provider_courses_url("PDC")) {
  readr::read_lines(pdc_training_url)
}
