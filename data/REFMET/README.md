RefMet
=====

## Usage
  
```r
get.rgsets <- function(rgsets) {
  url <- "https://github.com/montilab/hyperdb/raw/master/data/{0}.rds"
  temp <- tempfile(fileext=".rds")
  httr::GET(gsub("\\{0}", rgsets, url), 
            .send_headers = c("Accept" = "application/octet-stream"),
            httr::write_disk(temp, overwrite=TRUE))    
  return(readRDS(temp))
}
```

### Download RefMet metabolite-sets compendium

```r
refmet <- get.rgsets("REFMET/RMSETS_RefMet_2022_05_11")
length(refmet$genesets)
# [1] 1174
quantile(sapply(refmet$genesets,length))
#   0%   25%   50%   75%  100% 
#    1     1     3    10 28098 
```

### Filter out msets with <5 metabolites

```r
refmet$genesets <- refmet$genesets[sapply(refmet$genesets,length)>=5]
length(refmet$genesets)
# [1] 488
quantile(sapply(refmet$genesets,length))
#   0%   25%   50%   75%  100% 
#    5     7    13    56 28098 
```

