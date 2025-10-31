#' Extract the from dates from an SLUBI courses text
#' @param english_from_dates subset of raw HTML from the SLUBI website.
#' @export
extract_slubi_from_dates <- function(english_from_dates) {
  testthat::expect_true(length(english_from_dates) > 0)
  as.character(Vectorize(scoreto::extract_slubi_from_date)(english_from_dates))
}
