#' Get a table with all of the future courses
#'
#' @return a table with all future courses, sorted alphabetically by date
#' @export
get_courses <- function() {
  date_to <- NULL # No visible binding for global variable
  date_from <- NULL # No visible binding for global variable

  tibbles <- list()
  tibbles[[1]] <- get_adh_courses()
  tibbles[[2]] <- get_c3se_courses()
  tibbles[[3]] <- get_code_refinery_courses()
  tibbles[[4]] <- get_csc_courses()
  tibbles[[5]] <- get_enccs_courses()
  tibbles[[6]] <- get_hpc2n_courses()
  tibbles[[7]] <- get_infraviz_courses()
  tibbles[[8]] <- get_lunarc_courses()
  tibbles[[9]] <- get_naiss_courses()
  tibbles[[10]] <- get_nsc_courses()
  tibbles[[11]] <- get_pdc_courses()
  tibbles[[12]] <- get_sll_courses()
  tibbles[[13]] <- get_uppmax_courses()
  # tibbles[[14]] <- get_cdhu_courses() # CDHU has humans in mind

  # Check again
  for (i in seq_len(length(tibbles))) {
    t <- tibbles[[i]]
    testthat::expect_true(is_correctly_formatted_table(t))
  }




  t_with_nas <- dplyr::bind_rows(tibbles)
  t_any_date <- t_with_nas |> tidyr::drop_na()
  t <- t_any_date  |>
    dplyr::filter(date_to >= lubridate::today()) |>
    dplyr::arrange(date_from)
  t
}
