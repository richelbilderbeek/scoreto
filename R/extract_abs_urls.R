#' Extract an absolute/full URL from a piece of text
#'
#' The text can be messy :-)
#' @param text one line of text
#' @return one single URL without a trailing slash
#' @export
#' @examples
#' text <- paste0(
#'   "[Introduction to Bianca: Handling Sensitive Research Data ",
#'   "<br> _September 18 2026_](https://uppmax.github.io/bianca_workshops/",
#'   "beginner/intro/){ .md-button .md-button--primary }"
#' )
#' extract_abs_url(text) # https://uppmax.github.io/bianca_workshops
extract_abs_urls <- function(text) {
  as.character(Vectorize(scoreto::extract_abs_url)(text))

}
