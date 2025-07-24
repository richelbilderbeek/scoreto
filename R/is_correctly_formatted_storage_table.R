#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
#' @examples
#' is_correctly_formatted_storage_table(get_storage()) # True
#' is_correctly_formatted_storage_table("Nonsense") # False
is_correctly_formatted_storage_table <- function(t) { # nolint indeed a long function name

  if (!tibble::is_tibble(t)) return(FALSE)
  if (length(names(t)) != 6) return(FALSE)
  expected_names <- c(
    "storage_system",
    "storage_system_url",
    "data_sensitivity",
    "data_activity",
    "user_costs",
    "accessible_for"
  )
  if (!all(names(t) == expected_names)) return(FALSE)
  TRUE
}
