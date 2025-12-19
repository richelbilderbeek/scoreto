#' Get the URL to the NSC courses
#' @return the URL to the NSC courses
#' @examples
#' get_nsc_training_url()
#' @export
get_nsc_training_url <- function() {
  scoreto::get_provider_courses_url("NSC")
}
