#' Genetic Score metric
#' 
#' @author Luis Palomero, \email{lpalomerol@gmail.com}
#'
#' This metric "collapses" two-dimensional values into a one dimensional. 
#' This distance is related to the inverse diagonal from a 2D space metric varA/varB
#'
#' @param varA array of "X" dimension values.
#' @param varB array of "Y" dimension values
#'
#' @return Array with the antisense distance metric
#'
#' @examples
#' genScore(c(1,2,3,4), c(4,3,2,1))
#'
#' @export
genScore <- function(varA, varB){
  marginsA = c(max = max(varA), min=  min(varA))
  marginsB = c(max = max(varB), min = min(varB))
  score =
    (sqrt( (marginsA[['max']] - varA  )^2 + (marginsB[['min']] - varB)^2 ) ) -
    (sqrt( (marginsB[['max']] - varB  )^2 + (marginsA[['min']] - varA)^2 ) )
}
