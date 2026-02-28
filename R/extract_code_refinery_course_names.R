#' Extract the course names from an Code Refinery courses text
#' @param text subset of raw HTML
#'   from the Code Refinery website.
#' @export
extract_code_refinery_course_names <- function( # nolint
  text
) {
  names_in_urls <- stringr::str_match(
    text,
    "<a (rel=\"external\" )?href.*>(.*)</a>"
  )[, 3]
  names_without_urls <- stringr::str_match(
    text,
    "<li>(.*), [:digit:]"
  )[, 2]
  course_names <- names_in_urls
  na_indices <- which(is.na(course_names))
  course_names[na_indices] <- names_without_urls[na_indices]
  testthat::expect_equal(0, sum(is.na(course_names)))
  course_names
}
