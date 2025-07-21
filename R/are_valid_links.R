#' Detect if the links are valid
#' @param urls one or more URLs
#' @return TRUE if the link is valid, FALSE otherwise
#' @seealso use \link{is_valid_link} for checking one link
#' @export
#' @examples
#' urls <- c(
#'   "https://nbisweden.github.io/SCoRe_user_doc",
#'   "https://nonsense.url"
#' )
#' are_valid_links(urls)
are_valid_links <- function(urls) {
  as.logical(Vectorize(is_valid_link)(urls))
}
