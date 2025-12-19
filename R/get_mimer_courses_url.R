#' Get the URL to the Mimer courses page
#' @return the URL to the Mimer courses page
#' @export
get_mimer_courses_url <- function() {
  scoreto::get_provider_courses_url("Mimer")
}
