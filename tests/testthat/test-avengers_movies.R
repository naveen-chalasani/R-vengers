test_that("correct avengers movies output", {
  
  output <- avengers_movies()
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 9)
  expect_type(output$`IMDB Rating`, 'double')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  expect_equal(nrow(output), length(unique(output$Title)))
  
})