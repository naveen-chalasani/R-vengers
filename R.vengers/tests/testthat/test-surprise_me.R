test_that("correct surprise_me output", {
  
  output <- surprise_me()
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 9)
  expect_equal(nrow(output), 7)
  expect_is(output$Genre, 'character')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  expect_match(sample(output[[4]], 1), '*drama*', ignore.case = TRUE)
  expect_equal(nrow(output), length(unique(output$Title)))
  
})