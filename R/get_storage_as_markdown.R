#' Get all the storage resources, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/storage/}.
#' @param t a table, as returned by \link{get_storage}
#' @return a Markdown table of all storage resources, as text
#' @seealso use \link{get_storage} to get this
#' table as a table.
#' @export
get_storage_as_markdown <- function(t = get_storage()) {
  storage_system <- NULL # No visible binding for global variable
  center <- NULL # No visible binding for global variable
  center_md <- NULL # No visible binding for global variable

  testthat::expect_true(is_correctly_formatted_storage_table(t))

  # Merge columns storage_system and storage_system_url
  t$storage_system_md <- paste0("[", t$storage_system,"](", t$storage_system_url, ")")
  t$storage_system_url <- NULL

  # Add logos
  centers <- get_storage_to_center()
  centers$logo <- get_logo_paths(centers$center)
  centers$center_md <- paste0("![", centers$center, "](", centers$logo,")")
  names(centers)
  cluster_to_logo <- centers |>
    dplyr::select(storage_system, center, center_md) |>
    dplyr::group_by(storage_system) |>
    dplyr::summarise(logo = paste0(center_md, collapse = " "))
  t <- merge(t, cluster_to_logo)

  # Replace name
  t$storage_system <- t$storage_system_md
  t$storage_system_md <- NULL

  names(t)
  text <- knitr::kable(t)
  text[1] <- "|HPC storage system name|Data sensitivity|Data activity|User fee|Accessible for|Center(s)|"
  text
}
