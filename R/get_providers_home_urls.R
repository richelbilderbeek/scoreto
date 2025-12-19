#' get the URLs to the homepages of multiple providers
#' @param provider_names names of the providers
#' @seealso
#'   - \link{get_provider_home_url}: get the URLs to one homepage
#'     of a provider
#' @export
#' @examples
#' get_providers_home_urls(c("NAISS", "UPPMAX"))
get_providers_home_urls <- function(provider_names) {
  as.character(Vectorize(scoreto::get_provider_home_url)(provider_names))
}
