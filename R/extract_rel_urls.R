#' Extract one or more relative URL from a piece of text.
#'
#' Assumes that there is no or one relative URL per line.
#'
#' The text can be messy :-)
#' @param text one line of text
#' @return per line, one single relative URL (without a trailing slash) or NA
#' @export
#' @examples
#' text <- paste0(
#'   "<p><a class=\"md-button md-button--primary\" ",
#'   "href=\"../uppmax_intro_course/\">Introduction to Linux and ",
#'   "UPPMAX <br> <em>August 24-26 2026</em></a></p>"
#' )
#' extract_rel_urls(text) # ../uppmax_intro_course
extract_rel_urls <- function(text) {
  as.character(Vectorize(scoreto::extract_rel_url)(text))

}
