#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
#' @examples
#' is_correctly_formatted_other_table(get_other()) # True
#' is_correctly_formatted_other_table("Nonsense") # False
is_correctly_formatted_other_table <- function(t) { # nolint indeed a long function name

  if (!tibble::is_tibble(t)) return(FALSE)
  if (length(names(t)) != 5) return(FALSE)
  expected_names <- c(
    "name",
    "name_url",
    "description",
    "user_costs",
    "accessible_for"
  )
  if (!all(names(t) == expected_names)) return(FALSE)
  TRUE
}
