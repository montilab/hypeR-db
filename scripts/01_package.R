setwd('..')
path.to.indir <- file.path(getwd(), "raw/genesets")
path.to.outdir <- file.path(getwd(), "data/genesets")

files <- list.files(path=path.to.indir, pattern="*.txt", full.names=TRUE, recursive=FALSE)

package <- function() {
    # For each file in directory
    tmp <- lapply(files, function(fn) {
        # String formatting
        split <- strsplit(fn, "/")[[1]]
        id <- gsub(".txt", "", split[length(split)])
        # Read in raw file
        infile <- readLines(fn)
        # For each line in infile
        gsets <- lapply(infile, function(x) {
            # Text splitting by tabs
            text.split <- strsplit(x, "\t")[[1]]
            # Sanity check
            blank <- text.split[2]
            stopifnot(blank == "")
            # Geneset genes
            genes <- text.split[3:length(text.split)]
            # Accounts for multi-tab entries
            genes <- genes[genes != ""]
            return(genes)
        })
        # Tracking
        print(paste(id, ".rds", sep=""))
        print(length(gsets))
        # Names of genesets
        names(gsets) <- unlist(lapply(infile, function(x) strsplit(x, "\t")[[1]][1]))
        # Save object
        saveRDS(gsets, file.path(path.to.outdir, paste(id, ".rds", sep="")))
    })
}
