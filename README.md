hyperdb
=====

A [hypeR](https://github.com/montilab/hypeR) repository for relational genesets

[![](https://img.shields.io/github/last-commit/montilab/hyperdb.svg)](https://github.com/montilab/hyperdb/commits/master) 
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)

### Usage

``` r
get.rgsets <- function(rgsets) {
    url <- "https://github.com/montilab/hyperdb/raw/master/data/{0}.rds"
    temp <- tempfile(fileext=".rds")
    httr::GET(gsub("\\{0}", rgsets, url), 
              .send_headers = c("Accept" = "application/octet-stream"),
              httr::write_disk(temp, overwrite=TRUE))    
    return(readRDS(temp))
}

rgsets <- get.rgsets("REACTOME/REACTOME_v70.0")
rgsets <- get.rgsets("KEGG/KEGG_v92.0")
```
