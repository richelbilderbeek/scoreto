#' Is each line in a text a mermaid line?
#' @param text lines of text
#' @return a vector of booleans, one per line
#' @export
is_mermaid_line <- function(text) {
  booleans <- rep(FALSE, length(text))
  writer_state <- FALSE
  for (i in seq_along(text)) {
    if (text[i] == "```mermaid") {
      writer_state <- TRUE
    }
    if (text[i] == "```") {
      writer_state <- FALSE
    }
    booleans[i] <- writer_state
  }
  booleans
}
