context("test-categorizesamples")

test_that("Should categorize extreme values on default quartiles (ordered array)", {
  input = c(1,2,3,4)
  
  out = categorizeSamples(input)
  
  expect_equal(out, c(-1, 0, 0, 1))
  
})

test_that("Should categorize extreme values on default quartiles (unordered array)", {
  scores = c(1,4,3,2)
  
  out = categorizeSamples(scores)
  
  expect_equal(out, c(-1, 1, 0, 0))
  
})

test_that("should return extreme values when checking quartiles for 3 values", {
  input = c(1,2,3)
  
  out = categorizeSamples(input)
  
  expect_equal(out, c(-1, 0, 1))
  
})


test_that("should group by tertiles when setting theshold as 0.33, .66", {
  
  input = seq(1, 9)
  
  out = categorizeSamples(input, 1/3, 2/3)
  
  expect_equal(out, c(-1, -1, -1, 0, 0, 0, 1, 1, 1))
  
})

test_that("Should stop when low threshold value is greater than high one",{
  input = seq(1, 9)
  expect_error(categorizeSamples(input, 0.5, 0.15), 'Low threshold.* ')
})



