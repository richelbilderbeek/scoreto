#' Get the paths to the logos of a providers of computational resources
#' @param provider_names the names of a provider of computational resources
#' @return the paths to the logos
#' @export
get_logo_paths <- function(provider_names) {
  as.character(Vectorize(scoreto::get_logo_path)(provider_names))
}
