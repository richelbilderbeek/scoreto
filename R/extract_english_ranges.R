#' Extract the English date ranges from one or more lines of text
#'
#' The text can be messy :-)
#' @param text one or more lines of text
#' @return the English ranges
#' @seealso use \link{extract_english_range} to extract the date range
#' from one line of text
#' @export
#' @examples
#' extract_english_ranges("<p>27th Nov 2025</p>") # 27th Nov 2025
extract_english_ranges <- function(text) {
  as.character(Vectorize(scoreto::extract_english_range)(text))
}
