#' Determine if the URLs are correctly formatted.
#'
#' It does not check if the URLs exist
#' @param urls one or more URLs
#' @return logical vector with the same length as the URLs
#' @export
are_valid_urls <- function(urls) {
  as.logical(Vectorize(scoreto::is_valid_url)(urls))
}
