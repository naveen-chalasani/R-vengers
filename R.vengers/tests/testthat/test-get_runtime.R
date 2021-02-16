test_that("correct runtime output", {
  
  output <- get_runtime('water', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Year, 'double')
  expect_equal(colnames(output)[1] , 'Title')
  expect_equal(get_runtime('black water'), get_runtime('black+water'))
  expect_match(sample(output[[1]], 1), '*water*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})
