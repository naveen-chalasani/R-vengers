test_that("correct search output", {
  
  output <- search('queen', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 9)
  expect_type(output$`IMDB Rating`, 'double')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  expect_equal(search('the queen'), search('the+queen'))
  expect_match(sample(output[[1]], 1), '*queen*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})