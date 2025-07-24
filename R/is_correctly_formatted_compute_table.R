#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
is_correctly_formatted_compute_table <- function(t) { # nolint indeed a long function name

  if (!tibble::is_tibble(t)) return(FALSE)
  if (length(names(t)) != 6) return(FALSE)
  expected_names <- c(
    "hpc_cluster",
    "hpc_cluster_url",
    "compute_type",
    "data_type",
    "user_costs",
    "accessible_for"
  )
  if (!all(names(t) == expected_names)) return(FALSE)
  TRUE
}
