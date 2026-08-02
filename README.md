# genScore

R package for computing a combined **genetic score** from two equal-length score arrays, developed by Luis Palomero in support of analyses in:

**Palomero L, Galván-Femenía I, de Cid R, Espín R, Barnes DR, CIMBA, et al. Antoniou AC, Lázaro C, Pujana MA. Immune Cell Associations with Cancer Risk.** *iScience*. 2020;23(7):101296. [DOI: 10.1016/j.isci.2020.101296](https://doi.org/10.1016/j.isci.2020.101296) · [PMID: 32622267](https://pubmed.ncbi.nlm.nih.gov/32622267)

## What it does

The package treats two equal-sized score arrays as point coordinates in a 2D space (e.g., two GWAS-derived scores, or two expression/signature scores for the same samples). It computes a single combined metric — the **genetic score** — as the collapsed distance of each point to the inverse diagonal of that space. This condenses two related scores into one value that reflects their joint magnitude and relative balance, useful for ranking or classifying samples along a combined axis.

## Functions

- **`genScore`** — computes the genetic score from two equal-length score arrays
- **`categorizeSamples`** — categorizes samples into groups (low / middle / high, or left / right) based on their position on the score axis, returning `-1` (low), `0` (middle, when applicable), or `1` (high)

## Installation

```r
install.packages(c("devtools", "curl"))
library(devtools)
install_github("pujana-lab/genScore", ref = "master")
```

## Citation

If you use this code, please cite the publication above.

## Author

Luis Palomero (lpalomerol@gmail.com)
