#' Get the names of all the providers of computational resources
#' @return the names of all the providers in alphabetic order
#' @seealso Use \link{get_logo_path} to get the logo of a provider
#' @examples
#' get_all_providers()
#' @export
get_all_providers <- function() {
  c(
    "AIDA Data Hub",
    "C3SE",
    "Code Refinery",
    "CSC",
    "Doris SND",
    "ENCCS",
    "EOSC",
    "FEGA Sweden",
    "GBIF",
    "HPC2N",
    "InfraViz",
    "LUNARC",
    "Mimer",
    "NAISS",
    "NSC",
    "OSCU",
    "PDC",
    "SBDI",
    "SciLifeLab",
    "SITES",
    "SLUBI",
    "SND",
    "Stockholm University",
    "Swestore",
    "University of Gothenburg",
    "UPPMAX"
  )
}
