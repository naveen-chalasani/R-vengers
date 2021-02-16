test_that("correct poster output", {
  
  output <- get_poster('glass', 'movie')
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 4)
  expect_is(output$`Poster (link)`, 'character')
  expect_equal(colnames(output)[4] , 'Poster (link)')
  expect_equal(get_poster('the glass'), get_poster('the+glass'))
  expect_match(sample(output[[1]], 1), '*glass*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})