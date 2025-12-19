#' Get the URL to the SciLifeLab courses page
#' @return the URL to the SciLifeLab courses page
#' @export
get_sll_courses_url <- function() {
  scoreto::get_provider_courses_url("SciLifeLab")
}
