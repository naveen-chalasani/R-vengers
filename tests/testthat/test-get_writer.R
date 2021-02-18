test_that("errors for incorrect input", {
  
  expect_error(get_writer('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_writer(), "No input provided. Please search again.")
  
})


test_that("correct writer output", {
  
  output <- get_writer('girl', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Writer, 'character')
  expect_equal(colnames(output)[4] , 'Writer')
  expect_equal(get_writer('the girl'), get_writer('the+girl'))
  expect_match(sample(output[[1]], 1), '*girl*', ignore.case = TRUE)
 # expect_equal(nrow(output), length(unique(output$Title)))
  
})