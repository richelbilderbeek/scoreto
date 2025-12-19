#' Get the names of all the providers of computational resources
#' @return the names of all the providers in alphabetic order
#' @seealso Use \link{get_logo_path} to get the logo of a provider
#' @examples
#' get_all_providers()
#' @export
get_all_providers <- function() {
  scoreto::get_all_providers_info()$name
}
