#' Get the URL to the CSC courses page
#' @return the URL to the CSC courses page
#' @export
get_csc_courses_url <- function() {
  scoreto::get_provider_courses_url("CSC")
}
