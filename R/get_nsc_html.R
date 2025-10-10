#' Get the NSC courses as HTML
#' @param nsc_training_url the URL of the NSC training webpage
#' @return the HTML text of the NSC courses.
#' @seealso use \link{get_nsc_courses} to get the NSC courses as a table.
#'   Use \link{get_test_nsc_html} to get testing HTML.
#' @export
get_nsc_html <- function(nsc_training_url = scoreto::get_nsc_training_url()) {
  readr::read_lines(nsc_training_url)
}
