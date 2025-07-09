#' Determines if the input
#' is the name of a provider of computational resources
#' @param s the string to be tested
#' @return TRUE if the name is the name of a provider
#' @examples
#' is_provider("UPPMAX")
#' @export
is_provider <- function(s) {
  s %in% get_all_providers()
}
