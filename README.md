hyperdb
=====

A [hypeR](https://github.com/montilab/hypeR) repository for commonly used open source genesets

[![](https://img.shields.io/github/last-commit/montilab/hypeR.svg)](https://github.com/anfederico/hyperdb/commits/master) [![](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

### Usage

``` r
get.gset <- function(gset) {
    url <- "https://github.com/anfederico/hyperdb/raw/master/data/genesets/{0}.rds"
    r <- httr::GET(gsub("\\{0}", gset, url))
    raw <- httr::content(r, "raw", encoding="gzip")
    temp <- tempfile(fileext = ".rds")
    writeBin(raw, temp)
    return(readRDS(temp))
}

gset <- get.gset("Cancer_Cell_Line_Encyclopedia")
```

### Disclaimer

All genesets were downloaded and processed from the publicly available [libraries](https://amp.pharm.mssm.edu/Enrichr/#stats) hosted by [Enrichr](https://amp.pharm.mssm.edu/Enrichr/).