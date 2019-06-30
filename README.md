hyperdb
=====

A [hypeR](https://github.com/montilab/hypeR) repository for commonly used open source genesets

[![](https://img.shields.io/github/last-commit/montilab/hyperdb.svg)](https://github.com/montilab/hyperdb/commits/master) 
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)

### Usage

``` r
get.gset <- function(gset) {
    url <- "https://github.com/montilab/hyperdb/raw/master/data/genesets/{0}.rds"
    temp <- tempfile(fileext=".rds")
    httr::GET(gsub("\\{0}", gset, url), 
              .send_headers = c("Accept" = "application/octet-stream"),
              httr::write_disk(temp, overwrite=TRUE))    
    return(readRDS(temp))
}

gset <- get.gset("Cancer_Cell_Line_Encyclopedia")
```

### Disclaimer

Most genesets were downloaded and processed from the publicly available [libraries](https://amp.pharm.mssm.edu/Enrichr/#stats) hosted by [Enrichr](https://amp.pharm.mssm.edu/Enrichr/).