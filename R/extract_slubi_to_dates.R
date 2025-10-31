#' Extract the to dates from an SLUBI courses text
#' @param english_to_dates subset of raw HTML from the SLUBI website.
#' @export
extract_slubi_to_dates <- function(english_to_dates) {
  testthat::expect_true(length(english_to_dates) > 0)
  as.character(Vectorize(extract_slubi_to_date)(english_to_dates))
}
