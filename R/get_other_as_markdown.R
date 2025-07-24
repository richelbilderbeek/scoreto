#' Get all the other resources, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/other/}.
#' @param t a table, as returned by \link{get_other}
#' @return a Markdown table of all other resources, as text
#' @seealso use \link{get_other} to get this
#' table as a table.
#' @export
get_other_as_markdown <- function(t = get_other()) {
  name <- NULL # No visible binding for global variable
  center <- NULL # No visible binding for global variable
  center_md <- NULL # No visible binding for global variable

  testthat::expect_true(is_correctly_formatted_other_table(t))

  # Merge columns other_system and other_system_url

  t$name_md <- paste0("[", t$name, "](", t$name_url, ")")
  t$name_url <- NULL

  # Add logos
  centers <- get_other_to_center()
  centers$logo <- get_logo_paths(centers$center)
  centers$center_md <- paste0("![", centers$center, "](", centers$logo, ")")
  names(centers)
  cluster_to_logo <- centers |>
    dplyr::select(name, center, center_md) |>
    dplyr::group_by(name) |>
    dplyr::summarise(logo = paste0(center_md, collapse = " "))
  t <- merge(t, cluster_to_logo)

  # Replace name
  t$name <- t$name_md
  t$name_md <- NULL

  names(t)
  text <- knitr::kable(t)
  text[1] <- "|Name|Description|User fee|Accessible for|Center(s)|"
  text[2] <- get_optimal_markdown_divider(text)
  text
}
