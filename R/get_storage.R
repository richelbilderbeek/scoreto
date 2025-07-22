#' Get a table with all of the storage resources
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/storage/}.
#' @return a table with all storage resources,
#' sorted alphabetically by storage name
#' @seealso use \link{get_storage_as_markdown} to get this
#' table as Markdown text.
#' @export
get_storage <- function() {
  readr::read_csv(
    get_scoreto_path("storage.csv"),
    show_col_types = FALSE
  )
}
