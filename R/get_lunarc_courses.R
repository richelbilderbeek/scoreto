#' Get the LUNARC courses
#' @return a table with all LUNARC courses.
#' @export
get_lunarc_courses <- function() {
  lunarc_courses_url <- "https://www.lunarc.lu.se/learning-more/training-courses/"
  all_lines <- readr::read_lines(lunarc_courses_url)
  full_line <- stringr::str_subset(all_lines, "The following events are currently scheduled")
  line <- stringr::str_match(full_line, "<ul>(.*)</ul>")[, 2]
  lines_as_list <- stringr::str_split(line, pattern = "</li><li>")
  lines <- sapply(lines_as_list, "[[", 1)

  from_dates <- extract_lunarc_from_dates(lines)
  to_dates <- extract_lunarc_to_dates(lines)
  course_names <- extract_lunarc_course_names(lines)
  course_urls <- extract_lunarc_course_urls(lunarc_courses_text = lines)

  tibble::tibble(
    date_from = from_dates,
    date_to = to_dates,
    course_name = course_names,
    course_url = course_urls,
    provider_courses_url = lunarc_courses_url,
    provider_name = "LUNARC"
  )
}
