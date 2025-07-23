#' Get the optimal divider for a Markdown table
#' @param text a text that is a markdown table,
#' as returned by `knitr::kable`
#' @export
get_optimal_markdown_divider <- function(text) {
  testthat::expect_true(length(text) >= 3)
  testthat::expect_true(stringr::str_detect(text[2], "^(\\|:-+)+\\|$"))

  text_without_divider <- text[-2]
  text_without_begin_and_end_bar <- stringr::str_sub(text_without_divider, 2, -2)

  text_matrix <- stringr::str_split(text_without_begin_and_end_bar, "\\|", simplify = TRUE)


  get_length <- function(x) {
    x <- stringr::str_trim(x)
    # Replace images by placeholder
    x <- stringr::str_replace(x, "!\\[.*\\]\\(.*\\)", "___")
    # Replace link by its caption
    x <- stringr::str_replace(x, "\\(.*\\)", "")
    x <- stringr::str_replace(x, "\\[", "")
    x <- stringr::str_replace(x, "\\]", "")
    nchar(x)
  }
  lengths <- apply(text_matrix, c(1, 2), get_length)

  max_lengths <- apply(lengths, 2, max)

  paste0(
    "|:",
    paste0(strrep("-", max_lengths), collapse = "|:"),
    "|"
  )
}
