test_that("use", {
  pdc_courses_text <- c(
    "        <a title=\"PDC Summer School 2025: Introduction to High Performance Computing\" href=\"/about/events/pdc-summer-school-2025-introduction-to-high-performance-computing-1.1389436?date=2025-08-14&amp;orgdate=2025-07-10&amp;length=1&amp;orglength=0\">PDC Summer School 2025: Introduction to High Performance Computing</a>", # nolint
    "        <a title=\"Introduction to PDC Systems Course\" href=\"/about/events/introduction-to-pdc-systems-course-1.1410466?date=2025-09-29&amp;orgdate=2025-07-10&amp;length=1&amp;orglength=0\">Introduction to PDC Systems Course</a>" # nolint
  )
  course_urls <- extract_pdc_course_urls(pdc_courses_text)
  expect_equal(length(pdc_courses_text), length(course_urls))
  expect_equal(
    0,
    sum(stringr::str_detect(course_urls, "about/events/about/events"))
  )

})
