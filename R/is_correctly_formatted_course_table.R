#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
is_correctly_formatted_courses_table <- function(t) { # nolint indeed a long function name
  is_valid <- TRUE
  tryCatch(
    { scoreto::check_courses_table(t) },
    error = function(e) { is_valid <- FALSE }
  )
  is_valid
}
