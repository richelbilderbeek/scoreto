#' Get the NSC courses
#' @param html_text HTML text
#' @return a table with all NSC courses.
#' @examples
#' html_text <- readr::read_lines(get_scoreto_path("nsc.html"))
#' get_nsc_courses(html_text)
#' @export
get_nsc_courses <- function(html_text = scoreto::get_nsc_html()) {
  line <- stringr::str_subset(
    html_text,
    "<div class=\"row col-md-12 sub-sub-nav\"><ul><li class=\"sub\" onclick=\"window.location='/support/Events/Berzelius_training" # nolint
  )
  testthat::expect_equal(1, length(line))
  dirty_items <- stringr::str_split(line, "<li class=\"sub\" ")[[1]]
  all_items <- stringr::str_subset(dirty_items, "^onclick")
  all_nsc_courses_text <- stringr::str_subset(
    all_items,
    "Training|HPC|Tetralith|Sigma|VASP|WIEN2k"
  )
  nsc_courses_text <- stringr::str_subset(
    all_nsc_courses_text,
    "2020|2021|2022|2023|2024",
    negate = TRUE
  )

  from_dates <- scoreto::extract_nsc_from_dates(nsc_courses_text)
  to_dates <- scoreto::extract_nsc_to_dates(nsc_courses_text)
  course_names <- scoreto::extract_nsc_course_names(nsc_courses_text)
  course_urls <- scoreto::extract_nsc_course_urls(nsc_courses_text)

  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(to_dates))
  testthat::expect_equal(length(from_dates), length(course_names))
  testthat::expect_equal(length(from_dates), length(course_urls))

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = get_nsc_training_url(),
    provider_name = "NSC"
  )
}
