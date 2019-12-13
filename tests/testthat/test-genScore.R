context("test-genScore")


test_that("Should generate basic aggregated distance", {
  
  varA = c(1,2)
  varB = c(2,1)
  
  out = genScore(varA, varB)
  
  expect_equal(out, c(-1.41,1.41), tolerance = 1e-2)
})

test_that("should return midpoint value as 0 When looking 3 measures with one point 'in the middle'",{
  
  varA = c(3,2,1)  
  varB = c(1,2,3)
  
  out = genScore(varA, varB)

  expect_equal(out[2], 0)  
    
})

test_that("should return perfect correlation between this metric and PI metric when both input variables are perfectly anticorrelated",{
  varA = c(4,3,2,1)  
  varB = c(0, 1,2,3)
  
  out = genScore(varA, varB)
  pi = varA - varB

  outCor = cor.test(out, pi)  
  expect_equal(outCor$estimate[['cor']], 1)
})


test_that("should return perfect correlation between this metric and PI metric when both input variables are not correlated",{
  set.seed(12345)
  varA = runif(100)
  varB = runif(100)
  
  out = genScore(varA, varB)
  pi = varA - varB
  outCor = cor.test(out, pi)  
  baseCor = cor.test(varA, varB)
  
  expect_equal(baseCor$estimate[['cor']], 0, tolerance = 1e-3)  
  expect_gt(outCor$estimate[['cor']], 0.99)
})


test_that("Should return array of zeroes when values are perfetly correlated",{
  
  varA = seq(1:10)
  varB = seq(2:11) 

  out = genScore(varA, varB)

  expect_true(all(out == 0))

})



test_that("Should use labeled variables",{
  
  varA = seq(1,10)
  varB = seq(10,1) 
  
  expect_error(genScore(varX = varA, varY = varB), NA)

})


test_that("Should retreive greater varlues to values more far to (0,x) line", {

  thisDf = data.frame(
    point = sprintf('p%d', seq(1,10)),
    varX =  seq(1,10),
    varY = seq(10,1),
    stringsAsFactors = FALSE
  )

  thisDf$score  = genScore(varX = thisDf$varX, varY = thisDf$varY)
  maxVal = which.max(thisDf$score)
  expect_equal(thisDf[maxVal, 'point'], 'p10')
    
})

