test_that("errors for incorrect input", {
  
  expect_error(get_director('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_director(), "No input provided. Please search again.")
  
})


test_that("correct director output", {
  
  output <- get_director('boy', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Director, 'character')
  expect_equal(colnames(output)[4] , 'Director')
  expect_equal(get_director('the boy'), get_director('the+boy'))
  expect_match(sample(output[[1]], 1), '*boy*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})