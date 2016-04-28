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

getNodeStates <- function(data, tree){
	ml.values <- ace(data, tree, type = "discrete", method = "ML")
	col.nums <- max.col(ml.values$lik.anc)
	col.names <- colnames(ml.values$lik.anc)
	for(i in 1:length(col.nums)){
	states <- col.names[col.nums[i]]
	tree$node.label <- states
	print(states)
	print(tree)
}

}
