#' Get all the web_host resources, as a Markdown table
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/web_host/}.
#' @param t a table, as returned by \link{get_web_host}
#' @return a Markdown table of all web_host resources, as text
#' @seealso use \link{get_web_host} to get this
#' table as a table.
#' @export
get_web_host_as_markdown <- function(t = get_web_host()) {
  web_host <- NULL # No visible binding for global variable
  center <- NULL # No visible binding for global variable
  center_md <- NULL # No visible binding for global variable

  testthat::expect_true(is_correctly_formatted_web_host_table(t))

  # Merge columns web_host_system and web_host_system_url

  t$web_host_md <- paste0("[", t$web_host,"](", t$web_host_url, ")")
  t$web_host_url <- NULL

  # Add logos
  centers <- get_web_host_to_center()
  centers$logo <- get_logo_paths(centers$center)
  centers$center_md <- paste0("![", centers$center, "](", centers$logo,")")
  names(centers)
  cluster_to_logo <- centers |>
    dplyr::select(web_host, center, center_md) |>
    dplyr::group_by(web_host) |>
    dplyr::summarise(logo = paste0(center_md, collapse = " "))
  t <- merge(t, cluster_to_logo)

  # Replace name
  t$web_host <- t$web_host_md
  t$web_host_md <- NULL

  names(t)
  text <- knitr::kable(t)
  text[1] <- "|Web host name|Deploy type|Data sensitivity|User fee|Accessible for|Center(s)|"
  text
}
