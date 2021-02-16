test_that("correct genre output", {
  
  output <- get_genre('east', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$Genre, 'character')
  expect_equal(colnames(output)[4] , 'Genre')
  expect_equal(get_genre('the east'), get_genre('the+east'))
  expect_match(sample(ooutput[[1]], 1), '*east*', ignore.case = TRUE)
  expect_equal(nrow(ooutput), length(unique(output$Title)))
  
})