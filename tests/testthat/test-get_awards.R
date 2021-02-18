test_that("errors for incorrect input", {
  
  expect_error(get_awards('winter', 'summer'), "Type is invalid. Please use one of these : movie, series, episode, game")
  expect_error(get_awards(), "No input provided. Please search again.")
  
})


test_that("correct awards output", {
  
  output <- get_awards('flower', 'movie')
  expect_type(output, 'list')
  expect_true(is.data.frame(output))
  expect_equal(ncol(output), 4)
  expect_type(output$Awards, 'character')
  expect_equal(colnames(output)[4] , 'Awards')
  expect_equal(get_awards('the flower'), get_awards('the+flower'))
  expect_match(sample(output[[1]], 1), '*flower*', ignore.case = TRUE)
 # expect_equal(nrow(output), length(unique(output$Title)))
  
})