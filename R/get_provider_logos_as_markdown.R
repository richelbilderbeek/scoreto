#' Get the logo of the provider as Markdown
#' @param provider_names names of the provider
#' @return the logo of the providers as Markdown
#' @seealso use \link{get_all_provider_logos_as_markdown} to get the
#' Markdown of all these
#' @examples
#' get_provider_logos_as_markdown(c("NAISS", "UPPMAX"))
#' @export
get_provider_logos_as_markdown <- function(provider_names) { # nolint long name is fine
  as.character(
    Vectorize(scoreto::get_provider_logo_as_markdown)(provider_names)
  )
}
