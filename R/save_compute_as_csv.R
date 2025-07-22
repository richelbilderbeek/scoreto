#' Save all the courses, as a CSV text
#'
#' @param csv_filename path to the file to be created
#' @return Nothing
#' @export
save_compute_as_csv <- function(csv_filename = "compute.csv") {
  t <- get_compute()
  readr::write_csv(t, csv_filename)
}
