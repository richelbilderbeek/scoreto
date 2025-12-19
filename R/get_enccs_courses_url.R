#' Get the URL to the ENCCS courses page
#' @return the URL to the ENCCS courses page
#' @export
#' @examples
#' get_enccs_courses_url()
get_enccs_courses_url <- function() {
  scoreto::get_provider_courses_url("ENCCS")
}
