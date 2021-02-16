test_that("correct plot output", {
  
  output <- read_plot('women', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Plot, 'character')
  expect_equal(colnames(output)[4] , 'Plot')
  expect_equal(read_plot('the women'), read_plot('the+women'))
  expect_match(sample(output[[1]], 1), '*women*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})