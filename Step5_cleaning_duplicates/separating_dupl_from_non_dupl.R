##############
#INTRODUCTION#
##############

#This code gets a bim file and takes out all variants IDs that are not duplicated:

###################
#Loading libraries#
###################

library(data.table)
library(tidyverse)

##########################
#Load argument in Rscript#
##########################

args = commandArgs(trailingOnly=TRUE)

#####################################
#Loading duplicates in a cleaned way#
#####################################

duplicates <- fread("plink.dupvar")

print("ALL OK")

#Let's clean this properly:

id_tmp <- c()

for(dupl in duplicates$ID){

  ids <- strsplit(dupl, " +")[[1]]

  for(id in ids){

  id_tmp <- c(id_tmp, id)  

  }

}

id_tmp <- id_tmp[which(duplicated(id_tmp) == FALSE)]

#################
#Saving the data#
#################

fwrite(as.data.frame(id_tmp), "duplicated_ids.txt", quote = FALSE, row.names = FALSE, col.names = FALSE)

###################
#Take the bim data#
###################

bim <- fread(args)

#We remove the duplicates

bim_no_dupl <- bim[which(!(bim$V2%in%id_tmp)),]

#And now we save them:

fwrite(as.data.frame(bim_no_dupl$V2), "non_duplicated_ids.txt", quote = FALSE, row.names = FALSE, col.names = FALSE)



