#' Get a table with all of the web_host resources
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/web_host/}.
#' @return a table with all web_host resources,
#' sorted alphabetically by web_host name
#' @seealso use \link{get_web_host_as_markdown} to get this
#' table as Markdown text.
#' @export
get_web_host <- function() {
  readr::read_csv(
    scoreto::get_scoreto_path("web_host.csv"),
    show_col_types = FALSE
  )
}
