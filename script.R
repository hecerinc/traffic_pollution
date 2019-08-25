library(dplyr)
library(jsonlite)
library(ggplot2)

# Read in the data
dirs <- list.dirs(recursive = FALSE)
pollution <- do.call(bind_rows, lapply(dirs, function(x){
	files <- dir(x)
	do.call(bind_rows, lapply(files, function(y){
		fromJSON(readLines( paste0(x, "/", y) ))$results
	}))
}))
