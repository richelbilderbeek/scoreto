#' Get the last row of a table
#' @param t a table
#' @export
get_last_row <- function(t) {
  t[nrow(t), ]
}
