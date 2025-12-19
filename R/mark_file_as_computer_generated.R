#' Mark a filename as computer generated,
#' by adding comments to indicate this
#' @param filename name of the file to be changed
#' @export
mark_file_as_computer_generated <- function(filename) {

  testthat::expect_true(file.exists(filename))

  lines <- readr::read_lines(filename)

  is_mermaid_line <- scoreto::is_mermaid_line(lines)
  is_indented <- stringr::str_detect(lines, "^    ")
  is_next_indented <- is_indented[-1]
  is_empty <- stringr::str_detect(lines, "^[:blank:]*$")
  is_empty <- is_empty[-length(is_empty)]

  place_comment <- is_empty & !is_next_indented & !is_mermaid_line[-1]

  # This is the file to edit instead
  filename_for_humans <- stringr::str_replace(filename, "\\.md", "_1.md")

  comment_line <- paste0("<!-- DO NOT EDIT THIS COMPUTER GENERATED FILE. EDIT '", filename_for_humans, "' INSTEAD -->")
  lines[place_comment] <- comment_line

  readr::write_lines(lines, filename)
}
