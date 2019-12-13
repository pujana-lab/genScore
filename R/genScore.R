#' Genetic Score metric
#' 
#' @author Luis Palomero, \email{lpalomerol@gmail.com}
#'
#' This metric "collapses" two-dimensional values into a one dimensional. 
#' This distance is related to the inverse diagonal from a 2D space metric varA/varB
#'
#' @param varX array of "X" dimension values.
#' @param varY array of "Y" dimension values
#'
#' @return Array with the antisense distance metric, as more greater is this value
#'         the point is more far than (0,x) line, that is, more on the right corner of the plot.
#'
#' @examples
#' genScore(c(1,2,3,4), c(4,3,2,1))
#'
#' @export

genScore <- function(varX, varY){
  
  marginsX = c(max = max(varX), min = min(varX))
  marginsY = c(max = max(varY), min = min(varY))

  score =
    (sqrt( (marginsY[['max']] - varY  )^2 + (marginsX[['min']] - varX)^2 ) ) -    
    (sqrt( (marginsX[['max']] - varX  )^2 + (marginsY[['min']] - varY)^2 ) )

    
  return(score)
}
