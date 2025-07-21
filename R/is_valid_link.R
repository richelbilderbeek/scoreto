#' Detect if a link is valid
#' @return TRUE if the link is valid, FALSE otherwise
#' @export
is_valid_link <- function(url) {
  is_valid <- FALSE
  tryCatch({
    download.file(url, tempfile(), quiet = TRUE)
    is_valid <- TRUE
  },
    error = function(e) {},
    warning = function(w) {}
  )
  is_valid
}
