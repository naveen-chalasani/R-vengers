test_that("errors for incorrect input", {
  
  expect_error(get_rating('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_rating(), "No input provided. Please search again.")
  
})


test_that("correct rating output", {
  
  output <- get_rating('train', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Year, 'double')
  expect_equal(colnames(output)[2] , 'Type')
  expect_equal(get_rating('the train'), get_rating('the+train'))
  expect_match(sample(output[[1]], 1), '*train*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})