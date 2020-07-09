[![Travis build status](https://travis-ci.org/lpalomerol/genScore.svg?branch=master)](https://travis-ci.org/lpalomerol/genScore)

# genScore

Genetic Score metric library.

This library contains two functions, one `genScore` to compute this genetic score and other one `categorizeSamples` to group samples in two or three groups depending if they are on the left/center/right side of the plot.


## Installation
  
To install it use the R package devtools and its function install_github. Open an R session and enter the following commands:

```
install.packages(c("devtools","curl")) ##Installs devtools 
library(devtools)
install_github("pujana-lab/genScore",ref="master")
```

## Basic usage

### genScore

This method receives two equal-sized scores arrays, which can be understood as point coordinates in a 2D-space. The output score is a collapsed distance to the inverse diagonal related to this space.

```

x = c(1,2,3,4,5)
y = c(5,4,3,2,1)
score = genScore::genScore(x,y)

```

###  categorizeSamples

This method receives the previously computed scores list and categorizes the values in three groups (low-middle-high) according to the percentile scores provided as parameters.

```
genScore::categorizeSamples(score, 0.33, 0.66)
```