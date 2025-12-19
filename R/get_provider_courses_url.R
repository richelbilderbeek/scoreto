#' Get a URL to the courses page of a provider
#' @seealso \link{get_provider_home_url}
#' @export
#' @examples
#' get_provider_courses_url("UPPMAX")
get_provider_courses_url <- function(provider_name) {
  testthat::expect_true(provider_name %in% scoreto::get_all_providers())
  t <- scoreto::get_all_providers_info()
  testthat::expect_true(provider_name %in% t$name)
  t[t$name == provider_name, ]$courses_url
}
