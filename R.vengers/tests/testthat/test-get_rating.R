test_that("correct rating output", {
  
  output <- get_rating('train', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Year, 'double')
  expect_equal(colnames(output)[2] , 'Type')
  expect_equal(get_rating('the train'), get_rating('the+train'))
  expect_match(sample(output[[1]], 1), '*train*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})