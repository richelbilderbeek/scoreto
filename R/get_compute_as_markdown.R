#' Get all the compute resources, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/compute/}.
#' @param t a table, as returned by \link{get_compute}
#' @return a Markdown table of all compute resources, as text
#' @seealso use \link{get_compute} to get this
#' table as a table.
#' @export
get_compute_as_markdown <- function(t = get_compute()) {
  hpc_cluster <- NULL # No visible binding for global variable
  center <- NULL # No visible binding for global variable
  center_md <- NULL # No visible binding for global variable

  testthat::expect_true(is_correctly_formatted_compute_table(t))

  # Merge columns hpc_cluster and hpc_cluster_url
  t$hpc_cluster_md <- paste0("[", t$hpc_cluster, "](", t$hpc_cluster_url, ")")
  t$hpc_cluster_url <- NULL

  # Add logos
  centers <- get_cluster_to_center()
  centers$logo <- get_logo_paths(centers$center)
  centers$center_md <- paste0("![", centers$center, "](", centers$logo, ")")
  cluster_to_logo <- centers |>
    dplyr::select(hpc_cluster, center, center_md) |>
    dplyr::group_by(hpc_cluster) |>
    dplyr::summarise(logo = paste0(center_md, collapse = " "))
  t <- merge(t, cluster_to_logo)

  # Replace name
  t$hpc_cluster <- t$hpc_cluster_md
  t$hpc_cluster_md <- NULL

  names(t)
  text <- knitr::kable(t)
  text[1] <- paste0(
    "|HPC cluster name|Type of computation|Type of data|",
    "User fee|Accessible for|Center(s)|"
  )
  text[2] <- get_optimal_markdown_divider(text)
  text
}
