#' Extract the to dates from an NSC courses text
#' @param nsc_courses_text subset of raw HTML from the NSC website.
#' @export
extract_nsc_to_dates <- function(nsc_courses_text) {
  extract_nsc_from_dates(nsc_courses_text)
}
