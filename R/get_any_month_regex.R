#' Get a regular expression that matches any month
#' @note I did not expect that I would need to write this function
#' @return a regular expression for detecting a month
#' @export
get_any_month_regex <- function() {
  "January|February|March|April|May|June|July|August|September|October|November|December" # nolint
}
