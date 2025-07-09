#' Get the names of all the providers of computational resources
#' @return the names of all the providers in alphabetic order
#' @examples
#' get_all_providers()
#' @export
get_all_providers <- function() {
  c(
    "AIDA Data Hub",
    "ENCCS",
    "NAISS",
    "PDC",
    "SciLifeLab",
    "UPPMAX"
  )
}
