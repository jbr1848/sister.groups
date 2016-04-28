#Package to determine sister groups for comparison
library(ape) #utility functions
library(geiger) #utility functions
library(phytools) #utility functions
library(phangorn)

MergeData <- function(data1,data2) {
	merged.data<-merge(data1,data2,all=FALSE)
	merged.data.withrows<-as.data.frame(merged.data, row.names=merged.data[,1])
	merged.data.cleaned<-merged.data.withrows[,-1]
	print(merged.data.cleaned)
}



