#' Get the logos of all the providers as Markdown
#' @return the logos of all the providers as Markdown
#' @examples
#' get_all_provider_logos_as_markdown()
#' @export
get_all_provider_logos_as_markdown <- function() { # nolint long name is fine
  providers <- scoreto::get_all_providers()
  logo_paths <- scoreto::get_logo_paths(providers)
  testthat::expect_equal(length(providers), length(logo_paths))
  markdown_text <- paste0("![", providers, "](", logo_paths, ")")
  scoreto::surround_markdown_with_lintignore(markdown_text = markdown_text)
}
