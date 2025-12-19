#' Get the URL to the LUNARC courses page
#' @return the URL to the LUNARC courses page
#' @export
get_lunarc_courses_url <- function() {
  scoreto::get_provider_courses_url("LUNARC")
}
