#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
is_correctly_formatted_courses_table <- function(t) {

  if (!tibble::is_tibble(t)) return(FALSE)
  if (length(names(t)) != 6) return(FALSE)
  expected_names <- c(
    "date_from",
    "date_to",
    "course_name",
    "course_url",
    "provider_courses_url",
    "provider_name"
  )
  if (!all(names(t) == expected_names)) return(FALSE)

  if (nrow(t) > 0) {
    if (sum(is.na(t$course_url)) != 0) return(FALSE)
    if (sum(is.na(t$date_from)) != 0) return(FALSE)
    if (sum(is.na(t$date_to)) != 0) return(FALSE)
    if (!are_correctly_formatted_dates(t$date_from)) return(FALSE)
    if (!are_correctly_formatted_dates(t$date_to)) return(FALSE)
  }
  TRUE
}
