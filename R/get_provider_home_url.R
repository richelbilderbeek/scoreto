#' Get a URL to the homepage of a provider
#' @seealso
#'   - \link{get_providers_home_urls}: get the URLs to the homepages
#'     of multiple providers
#'   - \link{get_provider_courses_url}: for the courses page of the provider
#' @export
#' @examples
#' get_provider_home_url("UPPMAX")
get_provider_home_url <- function(provider_name) {
  testthat::expect_equal(1, length(provider_name))
  testthat::expect_true(provider_name %in% scoreto::get_all_providers())
  t <- scoreto::get_all_providers_info()
  testthat::expect_true(provider_name %in% t$name)
  t[t$name == provider_name, ]$home_url
}
