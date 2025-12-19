#' Get the logos of all the providers as Markdown
#' @return the logos of all the providers as Markdown
#' @seealso use \link{get_provider_logo_as_markdown} to get the
#' Markdown of a single clickable logo
#' @examples
#' get_all_provider_logos_as_markdown()
#' @export
get_all_provider_logos_as_markdown <- function() { # nolint long name is fine

  markdown_text <- scoreto::get_provider_logos_as_markdown(
    scoreto::get_all_providers()
  )
  scoreto::surround_markdown_with_lintignore(markdown_text = markdown_text)

}
