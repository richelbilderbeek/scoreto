#' Get a table with all of the other resources
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/other/}.
#' @return a table with all other resources,
#' sorted alphabetically by other name
#' @seealso use \link{get_other_as_markdown} to get this
#' table as Markdown text.
#' @export
get_other <- function() {
  readr::read_csv(
    get_scoreto_path("other.csv"),
    show_col_types = FALSE
  )
}
