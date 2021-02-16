test_that("correct surprise_me output", {
  
  output <- surprise_me_new(2)
  expect_is(output, 'data.frame')
  expect_equal(ncol(output), 9)
  expect_equal(nrow(output), 7*2)
  expect_is(output$Genre, 'character')
  expect_equal(colnames(output)[5] , 'Runtime (in minutes)')
  expect_equal(nrow(output), length(unique(output$Title)))
  expect_error(surprise_me_new(12))
  
})