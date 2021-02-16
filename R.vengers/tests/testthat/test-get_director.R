test_that("correct director output", {
  
  output <- get_director('boy', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Director, 'character')
  expect_equal(colnames(output)[4] , 'Director')
  expect_equal(get_director('the boy'), get_director('the+boy'))
  expect_match(sample(output[[1]], 1), '*boy*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})