#' Detect if a link is valid
#' @param url one URL
#' @return TRUE if the link is valid, FALSE otherwise
#' @seealso use \link{are_valid_links} for checking multiple links
#' @export
#' @examples
#' is_valid_link("https://nbisweden.github.io/SCoRe_user_doc") # TRUE
#' is_valid_link("https://nonsense.url") # FALSE
is_valid_link <- function(url) {
  is_valid_link_impl_4(url)
}

# From https://stackoverflow.com/a/53858028/3364162
is_valid_link_impl_4 <- function(url) {

  httr::set_config(config(ssl_verifypeer = 0L))
  x <- GET(url)
  x$status_code != 404
}

# From https://stackoverflow.com/a/54290142/3364162
is_valid_link_impl_3 <- function(url) {

  response <-
    httr2::request(url) %>%
    httr2::req_perform(verbosity = 3)
  response
}

#' Checks if a URL is valid
#'
#' From \url{https://stackoverflow.com/a/52915256/3364162}.
#' @param x a single URL
#' @param non_2xx_return_value what to do if the site exists but the
#'        HTTP status code is not in the `2xx` range. Default is to return `FALSE`.
#' @param quiet if not `FALSE`, then every time the `non_2xx_return_value` condition
#'        arises a warning message will be displayed. Default is `FALSE`.
#' @param ... other params (`timeout()` would be a good one) passed directly
#'        to `httr::HEAD()` and/or `httr::GET()`
is_valid_link_impl_2 <- function(x, non_2xx_return_value = FALSE, quiet = FALSE, ...) {

  suppressPackageStartupMessages({
    require("httr", quietly = FALSE, warn.conflicts = FALSE)
  })

  # you don't need thse two functions if you're alread using `purrr`
  # but `purrr` is a heavyweight compiled pacakge that introduces
  # many other "tidyverse" dependencies and this doesnt.
  capture_error <- function(code, otherwise = NULL, quiet = TRUE) {
    tryCatch(
      list(result = code, error = NULL),
      error = function(e) {
        if (!quiet)
          message("Error: ", e$message)

        list(result = otherwise, error = e)
      },
      interrupt = function(e) {
        stop("Terminated by user", call. = FALSE)
      }
    )
  }

  safely <- function(.f, otherwise = NULL, quiet = TRUE) {
    function(...) capture_error(.f(...), otherwise, quiet)
  }

  sHEAD <- safely(httr::HEAD)
  sGET <- safely(httr::GET)

  # Try HEAD first since it's lightweight
  res <- sHEAD(x, ...)

  if (is.null(res$result) ||
      ((httr::status_code(res$result) %/% 200) != 1)) {

    res <- sGET(x, ...)

    if (is.null(res$result)) return(NA) # or whatever you want to return on "hard" errors

    if (((httr::status_code(res$result) %/% 200) != 1)) {
      if (!quiet) warning(sprintf("Requests for [%s] responded but without an HTTP status code in the 200-299 range", x))
      return(non_2xx_return_value)
    }

    return(TRUE)

  } else {
    return(TRUE)
  }
}

# From https://stackoverflow.com/a/60627969/3364162
is_valid_link_impl_1 <- function(url) {

  con <- base::url(url)
  check <- suppressWarnings(
    try(
      open.connection(
        con,
        open = "rt",
        timeout = 1
      ),
      silent = TRUE
    )[1])
  suppressWarnings(try(close.connection(con),silent = TRUE))
  ifelse(is.null(check),TRUE,FALSE)
}
