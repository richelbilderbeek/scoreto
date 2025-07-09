#' Get all the future courses
#'
#' @return a table with all future courses, sorted alphabetically by date
#' @export
get_courses <- function() {
  tibbles <- list()
  tibbles[[1]] <- get_adh_courses()
  tibbles[[2]] <- get_naiss_courses()
  tibbles[[3]] <- get_sll_courses()
  tibbles[[4]] <- get_uppmax_courses()
  tibbles[[5]] <- get_enccs_courses()

  # Check again
  for (i in seq_len(length(tibbles))) {
    t <- tibbles[[i]]
    testthat::expect_true(is_correctly_formatted_table(t))
  }


  # TODO: Add HPC2N
  # TODO: Add PDC
  # TODO: Add C3SE
  # TODO: Add NSC
  # TODO: Add LUNARC


  t_with_nas <- dplyr::bind_rows(tibbles)
  t_any_date <- t_with_nas |> tidyr::drop_na()
  t <- t_any_date  |>
    dplyr::filter(date_to >= lubridate::today()) |>
    dplyr::arrange(date_from)
  t
}
