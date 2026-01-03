#' Get the URL to the courses of a provider
#' @param course_provider name of the course provider
#' @return the URL to the courses of a provider
#' @examples
#' get_training_url("UPPMAX")
#' @export
get_training_url <- function(course_provider) {
  scoreto::get_provider_courses_url(course_provider)
}
