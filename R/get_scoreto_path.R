#' Get the full path of a file in the `inst/extdata` folder
#' @param filename	the file's name, without the path description
#' @return the full path of the filename
#' @author Richèl J.C. Bilderbeek
#' @export
#' @examples
#' get_scoreto_path("compute.csv")
get_scoreto_path <- function(filename)
{
    full <- system.file("extdata", filename, package = "scoreto")
    if (!file.exists(full)) {
        stop("'filename' must be the name of a file in 'inst/extdata'")
    }
    full
}
