#Package to determine sister groups for comparison
source("~/phyloMeth.packages/sister.group/sister.group.functions.R")

#Example data
ploidy.data <- read.csv(file="~/Documents/Data/ploidy.data.txt", stringsAsFactors=FALSE)
PTGR.data <- read.csv(file="~/Documents/Data/PTGR.data.1March2016.txt", stringsAsFactors=FALSE)
tree.zanne <- read.tree("~/R/Vascular_Plants_rooted.dated.tre")

#Steps
#run independent contrasts
#figure out which nodes you want to keep
#filter these nodes out of the pic data
#run analysis

#add a function that returns all of the ages of the nodes

comb.data <- MergeData(ploidy.data, PTGR.data)
data.plus.tree <- treedata(tree.zanne, comb.data, sort=TRUE)


pic.discrete <- pic(data.plus.tree$data[,1], data.plus.tree$phy)
pic.continuous <- pic(data.plus.tree$data[,2], data.plus.tree$phy)


data.plus.tree$phy$node.label <- pic.discrete

#subset(data.plus.tree$phy$node.label, )
plot.phylo(data.plus.tree$phy, show.node.label=TRUE, cex=0.15)



meh <- as.data.frame(data.plus.tree$phy$node.label)
meh2 <- subset(meh, data.plus.tree$phy$node.label != 0)

getSisters(data.plus.tree$phy, node=366)
getDescendants(data.plus.tree$phy, node=320)
meh3 <- extract.clade(data.plus.tree$phy, node = 320)

