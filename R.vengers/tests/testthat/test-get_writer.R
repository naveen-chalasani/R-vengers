test_that("correct writer output", {
  
  output <- get_writer('girl', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Writer, 'character')
  expect_equal(colnames(output)[4] , 'Writer')
  expect_equal(get_writer('the girl'), get_writer('the+girl'))
  expect_match(sample(output[[1]], 1), '*girl*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})