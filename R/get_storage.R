#' Get a table with all of the storage resources
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/storage/}.
#' @param check_file Check the file before reading it.
#' This is used for debugging and can be assumed to not be needed.
#' @return a table with all storage resources,
#' sorted alphabetically by storage name
#' @seealso use \link{get_storage_as_markdown} to get this
#' table as Markdown text.
#' @export
get_storage <- function(check_file = FALSE) {
  testthat::expect_equal(length(check_file), 1)
  testthat::expect_true(check_file %in% c(TRUE, FALSE))
  filename <- scoreto::get_scoreto_path("storage.csv")
  if (check_file == TRUE) {
    text <- readr::read_lines(filename)
    n_commas <- stringr::str_count(text, ",")
    testthat::expect_true(all(n_commas == n_commas[1]))
  }
  readr::read_csv(
    filename,
    show_col_types = FALSE
  )
}
