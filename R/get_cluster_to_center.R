#' Get a table of all the HPC clusters and the center(s) these
#' are connected to.
#'
#' @return a table with all HPC clusters and the center(s) these
#' are connected to, sorted alphabetically by HPC cluster name
#' @export
get_cluster_to_center <- function() {
  readr::read_csv(
    scoreto::get_scoreto_path("cluster_to_center.csv"),
    show_col_types = FALSE
  )
}
