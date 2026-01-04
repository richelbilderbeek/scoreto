#' Extract the English date ranges from one or more lines of text
#'
#' The text can be messy :-)
#' @param text one or more lines of text
#' @return the English ranges
#' @export
#' @examples
#' extract_english_ranges("nonsense 27-28 November 2025 lalala")
extract_english_ranges <- function(text) {
  as.character(Vectorize(scoreto::extract_english_range)(text))
}
