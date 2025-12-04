#' Surround Markdown text with Markdownlint ignore numbers
#' @param markdown_text Markdown text
#' @return Markdown surrounded by Markdownlint ignores
#' @export
surround_markdown_with_lintignore <- function(markdown_text) {
  c(
    "<!-- markdownlint-disable MD060 --><!-- The pipes must not line up -->",
    "",
    markdown_text,
    "",
    "<!-- markdownlint-enable MD060 -->"
  )
}
