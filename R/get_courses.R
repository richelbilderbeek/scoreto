#' Get all the courses
#' @return a table with all courses.
#' @export
get_courses <- function() {
  tibbles <- list()
  tibbles[[1]] <- get_adh_courses()
  tibbles[[2]] <- get_naiss_courses()
  tibbles[[3]] <- get_sll_courses()

  # TODO: Add ENCCS
  # TODO: Add UPPMAX
  # TODO: Add HPC2N
  # TODO: Add PDC
  # TODO: Add C3SE
  # TODO: Add NSC
  # TODO: Add LUNARC

  t <- dplyr::bind_rows(tibbles)
  t |> tidyr::drop_na()
}
