#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
#' @examples
#' is_correctly_formatted_web_host_table(get_web_host()) # True
#' is_correctly_formatted_web_host_table("Nonsense") # False
is_correctly_formatted_web_host_table <- function(t) { # nolint indeed a long function name

  if (!tibble::is_tibble(t)) return(FALSE)
  if (length(names(t)) != 6) return(FALSE)
  expected_names <- c(
    "web_host",
    "web_host_url",
    "deploy_type",
    "data_sensitivity",
    "user_costs",
    "accessible_for"
  )
  if (!all(names(t) == expected_names)) return(FALSE)
  TRUE
}
