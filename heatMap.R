#using pheatmap package in R
library(pheatmap)
library(RColorBrewer)
library(dplyr)

#the following example is when you have a normalised count table
norm.count.table <- read.table("path/to/normalised/gene/table", row.names=1) #path to normalised count table

#top up and downregulated genes table sorted based on log2foldchange value 
up.dea <- read.table("path/to/upregulatedgenetable")  #log2foldchange > 2
down.dea <- read.table("path/to/downregulatedgenetable")  #log2foldchange < -2

#taking the top 20 upregulated and top 20 downregulated genes 
top.dea <- rbind(up.dea[1:20,], down.dea[1:20, ])
#taking the top deg
norm.count.table[rownames(top.dea),] -> x

#conditions <- c("control_1", "control_2", "control_3","treated_1", "treated_2", "treated_3") #this is mostly the "colnames(norm.count.table)"
#creating anotation for your column
#annotation_column <- data.frame(row.names = conditions, condition = factor(grepl("control", conditions), levels = c(T,F), labels = c("control", "treated")))

#creating annotation for column
conditions <- data.frame(group = rep(c("control", "normalflow"), c(3,3)))
colnames(norm.table) -> row.names(conditions)

new.column.names <- c("control_1", "control_2", "control_3","treated_1", "treated_2", "treated_3")   #this is mostly the "colnames(norm.count.table)"

png("Heatmap.png", 
    width =15*300, 
    height = 18*300, 
    res = 400, 
    pointsize = 10)
pheatmap(x, 
         scale="row", #scaling by row makes the heatmap look like your data was normalised and plotted by z-score
         cluster_rows=TRUE, #clustering by default is based on euclidean clustering and heirarical clustering
         cluster_cols=FALSE, 
         color=colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255), #colour for the heatmap cells
         annotation_col=conditions, #annotating the column creates a small legend about your sample
         annotation_colors=list(condition = c("control"="#FF5733", "treated"="#FFC300")), #defing the color for annotation
         angle_col = 45, #labelling of column is 90 degree by default 
         border_color = NA, #boarder color can make each cell look seperate
         labels_row = row.names(top.dea), #by default it takes the row names of your x 
         labels_col = new.column.names, #by default it takes the column name of your x
         main = "Heatmap for top significantly Upregulated and Downregulated genes",   #title 
         cellwidth=30,  #size of the cell
         cellheight=16,)
dev.off()
