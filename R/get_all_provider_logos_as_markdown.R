#' Get the logos of all the providers as Markdown
#' @return the logos of all the providers as Markdown
#' @examples
#' get_all_provider_logos_as_markdown()
#' @export
get_all_provider_logos_as_markdown <- function() { # nolint long name is fine
  t <- scoreto::get_all_providers_info()
  links_to_home <- paste0("[", t$name, "](", t$home_url, ")")
  logo_paths <- scoreto::get_logo_paths(t$name)
  # From https://stackoverflow.com/a/61072867/3364162:
  # [![name](link to image on GH)](link to your URL)
  markdown_text <- paste0(
    "[![", t$name, "](", logo_paths, ")](", t$home_url, ")"
  )
  scoreto::surround_markdown_with_lintignore(markdown_text = markdown_text)

}
