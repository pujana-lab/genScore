#' Categorize samples on groups
#' 
#' @author Luis Palomero, \email{lpalomerol@gmail.com}
#'
#' This method categorizes samples in left-right groups
#'
#' @param scores array of collapsed scores.
#' @param lowThrehsold Threshold within samples are considered in "low" group.
#' @param highThrehsold Threshold within samples are considered in "high" group.
#'
#' @return Array with categorized values in three groups. This array have three different values
#'          "-1" samples are categorized at "low" threshold
#'          "0" samples are categorized at "middle" threshold
#'          "1" samples are categorized at "high" threshold
#'
#' @examples
#' categorizeSamples(c(1,2,3,4))
#' categorizeSamples(c(1,2,3,4), 0.25, 0.75) 
#'
#' @export

categorizeSamples <- function(scores, 
                              lowThreshold = 0.25, 
                              highThreshold = 0.75){
  if(lowThreshold > highThreshold){
    stop(sprintf("Low threshold (%s) must be lower than high threshold (%s)", lowThreshold, highThreshold))
  }
  return(
    as.numeric(quantcut(scores, c(0, lowThreshold, highThreshold, 1))) - 2
  )
  
}
