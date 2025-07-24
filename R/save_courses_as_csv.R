#' Save all the courses, as a CSV text
#'
#' @param csv_filename path to the file to be created
#' @return Nothing
#' @export
save_courses_as_csv <- function(csv_filename = "courses.csv") {
  t <- scoreto::get_courses()
  readr::write_csv(t, csv_filename)
}
