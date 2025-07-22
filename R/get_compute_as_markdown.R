#' Get all the compute resources, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/compute/}.
#' @param t a table, as returned by \link{get_compute}
#' @return a Markdown table of all compute resources, as text
#' @seealso use \link{get_compute} to get this
#' table as a table.
#' @export
get_compute_as_markdown <- function(t = get_compute()) {

  knitr::kable(t)
}
