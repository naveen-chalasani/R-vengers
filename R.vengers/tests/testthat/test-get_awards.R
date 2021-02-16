test_that("correct awards output", {
  
  output <- get_awards('flower', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Awards, 'character')
  expect_equal(colnames(output)[4] , 'Awards')
  expect_equal(get_awards('the flower'), get_awards('the+flower'))
  expect_match(sample(output[[1]], 1), '*flower*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})