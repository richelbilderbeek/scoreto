test_that("use", {
  infraviz_courses_text <- "<h2 class=\"wp-block-post-title\"><a href=\"https://infravis.se/workshop-introduction-to-nodegoat/\" target=\"_self\" >Workshop: Introduction to NodeGoat</a></h2>" # nolint
  course_names <- extract_infraviz_course_names(infraviz_courses_text)
  expect_equal(length(infraviz_courses_text), length(course_names))
})
