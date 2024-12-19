library(dplyr)
library(Seurat)
library(patchwork)


input <- function(inputfile) {
pbmc.data <<- Read10X(data.dir=inputfile)
}

run <- function() {
}

output <- function(outputfile) {
pbmc <- CreateSeuratObject(counts=pbmc.data, project="pbmc3k", min.cells=3, min.features=200)
pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern="^MT-")
write.csv(pbmc[["percent.mt"]], paste(outputfile,"csv",sep="."))
saveRDS(pbmc, paste(outputfile,"rds",sep="."))
}
