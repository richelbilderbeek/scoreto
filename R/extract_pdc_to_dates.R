#' Extract the to dates from an PDC courses text
#' @param pdc_courses_text subset of raw HTML from the PDC website.
#' @export
extract_pdc_to_dates <- function(pdc_courses_text) {
  scoreto::extract_pdc_from_dates(pdc_courses_text)
}
