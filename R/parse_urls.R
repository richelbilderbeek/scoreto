#' Combine a base URL with multiple relative URLs
#' @param base_url base URL
#' @param relative_urls a relative URL
#' @return a URL
#' @export
parse_urls <- function(base_url, relative_urls) {
  urls <- rep(NA, length(relative_urls))
  for (i in seq_along(relative_urls)) {
    urls[i] <- httr2::url_build(
      httr2::url_parse(url = relative_urls[i], base_url = base_url)
    )
  }
  urls
}
