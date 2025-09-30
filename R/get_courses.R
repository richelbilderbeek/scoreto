#' Get a table with all of the future courses
#'
#' This table is displayed at
#' \url{https://nbisweden.github.io/SCoRe_user_doc/courses/}.
#' @return a table with all future courses, sorted alphabetically by date
#' @seealso use \link{get_courses_as_markdown} to get this
#' table as Markdown text.
#' @export
get_courses <- function() {
  date_to <- NULL # No visible binding for global variable
  date_from <- NULL # No visible binding for global variable

  tibbles <- list()
  tibbles[[1]] <- scoreto::get_adh_courses()
  tibbles[[2]] <- scoreto::get_c3se_courses()
  tibbles[[3]] <- scoreto::get_code_refinery_courses()
  tibbles[[4]] <- scoreto::get_csc_courses()
  tibbles[[5]] <- scoreto::get_enccs_courses()
  tibbles[[6]] <- scoreto::get_hpc2n_courses()
  tibbles[[7]] <- scoreto::get_infraviz_courses()
  tibbles[[8]] <- scoreto::get_lunarc_courses()
  tibbles[[9]] <- scoreto::get_naiss_courses()
  tibbles[[10]] <- scoreto::get_nsc_courses()
  tibbles[[11]] <- scoreto::get_pdc_courses()
  tibbles[[12]] <- scoreto::get_sll_courses()
  tibbles[[13]] <- scoreto::get_uppmax_courses()
  tibbles[[14]] <- scoreto::get_slubi_courses()

  # Check again
  for (i in seq_len(length(tibbles))) {
    t <- tibbles[[i]]
    testthat::expect_true(scoreto::is_correctly_formatted_courses_table(t))
  }

  t_with_nas <- dplyr::bind_rows(tibbles)
  t_any_date <- t_with_nas |> tidyr::drop_na()
  t <- t_any_date  |>
    dplyr::filter(date_to >= lubridate::today()) |>
    dplyr::arrange(date_from)
  t
}
