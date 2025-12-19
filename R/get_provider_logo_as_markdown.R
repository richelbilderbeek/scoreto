#' Get the logo of the provider as Markdown
#' @return the logo of the providers as Markdown
#' @seealso use \link{get_all_provider_logos_as_markdown} to get the
#' Markdown of all these
#' @examples
#' get_provider_logo_as_markdown("UPPMAX")
#' @export
get_provider_logo_as_markdown <- function(provider_name) { # nolint long name is fine
  testthat::expect_equal(1, length(provider_name))
  paste0(
    "[![", provider_name, "](", scoreto::get_logo_path(provider_name), ")]",
    "(", scoreto::get_provider_home_url(provider_name), ")"
  )
}
