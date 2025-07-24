#' Get a table with all of the compute resources
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/compute/}.
#' @return a table with all compute courses,
#' sorted alphabetically by resource name
#' @seealso use \link{get_compute_as_markdown} to get this
#' table as Markdown text.
#' @export
get_compute <- function() {
  readr::read_csv(
    scoreto::get_scoreto_path("compute.csv"),
    show_col_types = FALSE
  )
}
