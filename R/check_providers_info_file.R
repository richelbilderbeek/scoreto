#' Check the file to provide a table with all of the providers' information
#'
#' @return nothing, will \link{stop} if there is a problem with the file
#' @export
check_providers_info_file <- function() {
  info_path <- scoreto::get_scoreto_path("providers_info.csv")

  # 'read_lines' produces output. This is a known bug,
  # e.g. https://github.com/tidyverse/readr/issues/1501
  text <- readr::read_lines(info_path)
  testthat::expect_true(length(text) > 2)
  n_cols <- length(stringr::str_split(text, ",")[[1]])
  n_rows <- length(text) - 1 # header
  expected_n_cells <- n_cols * n_rows
  n_cells <- length(unlist(stringr::str_split(text, ",")))
  if (expected_n_cells != n_cells) {
    for (row_index in seq_len(n_rows)) {
      n_cols_here <- length(stringr::str_split(text, ",")[[row_index]])
      if (n_cols_here != n_cols) {
        stop(
          "ERROR: 'info_path' file '", info_path, "' invalid: ",
          "Row with index ", row_index, " ",
          "has a different amount of columns (", n_cols_here, ") ",
          "compared to the header (", n_cols, ")"
        )
      }
    }
  }
  invisible(NULL)
}
