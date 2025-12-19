#' Get the logos of all the providers as Markdown
#' @return the logos of all the providers as Markdown
#' @examples
#' get_all_provider_logos_as_markdown()
#' @export
get_all_provider_logos_as_markdown <- function() { # nolint long name is fine
  t <- scoreto::get_all_providers_info()
  links_to_home <- paste0("[", t$name, "](", t$home_url, ")")
  logo_paths <- scoreto::get_logo_paths(t$name)
  markdown_text <- paste0("![", links_to_home, "](", logo_paths, ")")
  scoreto::surround_markdown_with_lintignore(markdown_text = markdown_text)
}
