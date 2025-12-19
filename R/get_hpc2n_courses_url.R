#' Get the URL to the HPC2N courses page
#' @return the URL to the HPC2N courses page
#' @export
get_hpc2n_courses_url <- function() {
  scoreto::get_provider_courses_url("HPC2N")
}
