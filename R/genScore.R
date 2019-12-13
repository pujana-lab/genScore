genScore <- function(varA, varB){
  marginsA = c(max = max(varA), min=  min(varA))
  marginsB = c(max = max(varB), min = min(varB))
  score =
    (sqrt( (marginsA[['max']] - varA  )^2 + (marginsB[['min']] - varB)^2 ) ) -
    (sqrt( (marginsB[['max']] - varB  )^2 + (marginsA[['min']] - varA)^2 ) )
}
