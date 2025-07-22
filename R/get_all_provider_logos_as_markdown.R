#' Get the logos of all the providers as Markdown
#' @return the logos of all the providers as Markdown
#' @examples
#' get_all_provider_logos_as_markdown()
#' @export
get_all_provider_logos_as_markdown <- function() {
  providers <- get_all_providers()
  logo_paths <- get_logo_paths(providers)
  testthat::expect_equal(length(providers), length(logo_paths))
  paste0("![", providers, "](", logo_paths, ")")
}
