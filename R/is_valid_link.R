#' Detect if a link is valid
#' @param url one URL
#' @return TRUE if the link is valid, FALSE otherwise
#' @seealso use \link{are_valid_links} for checking multiple links
#' @source From \url{https://stackoverflow.com/a/53858028/3364162}
#' @export
#' @examples
#' is_valid_link("https://nbisweden.github.io/SCoRe_user_doc") # TRUE
#' is_valid_link("https://nonsense.url") # FALSE
is_valid_link <- function(url) {
  httr::set_config(httr::config(ssl_verifypeer = 0L))
  tryCatch({
      x <- httr::GET(url)
      x$status_code != 404
    },
    error = function(e) {
      return(FALSE)
    }
  )
}
