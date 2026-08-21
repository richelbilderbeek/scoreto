#' Determine if the table is correctly formatted
#' @param t a table
#' @return TRUE if the table is correctly formatted
#' @export
is_correctly_formatted_courses_table <- function(t) { # nolint indeed a long function name
  is_valid <- FALSE
  tryCatch({
    scoreto::check_courses_table(t)
    is_valid <- TRUE
  }, error = function(e) {} # nolint ignore result
  )
  is_valid
}
