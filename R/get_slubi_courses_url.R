#' Get the URL to the SLUBI courses page
#' @return the URL to the SLUBI courses page
#' @export
get_slubi_courses_url <- function() {
  scoreto::get_provider_courses_url("SLUBI")
}
