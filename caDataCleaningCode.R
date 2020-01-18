#CA2 R Script to clean and prepare the dataset for MapReduce using Python

#Ensure data is cleaned and prepared so that you can run MapReduce using python 
setwd("C:/Users/Alexander/Desktop/CA2 -AlexanderMillea_10349189")

#Load csv + create backup
caDataInsurance <- read.csv("dataInsurance.csv", stringsAsFactors = FALSE)
backup <- caDataInsurance

#load dplyr libraries - depends if want to use or not
library(dplyr)
library(stopwords)
library(tidyverse)

#load head and tail or dataset - help get a feel for the data
head(caDataInsurance)
tail(caDataInsurance)

#identify num of rows and cols
ncol(caDataInsurance); nrow(caDataInsurance)

#identify NA's - either remove or replace (prob will remove)
sapply(caDataInsurance,function(x) sum(is.na(x))) #run this again to ensure NA's are removed
caDataInsurance <- caDataInsurance[!is.na(caDataInsurance$total_hrs_in_status), ] #repeat if needed

#select column to use
newCol <- caDataInsurance$claim_vehicle_make
print(newExample)

#check class
class(newCol)

#remove fullstops and hyphen
newCol <- gsub('\\.', '-', newCol)

#remove @ *.
newCol <- gsub("@.*","",newCol)

#remove ascii - double check it has worked
iconv(newCol, "latin1", "ASCII", sub="")

#remove nums and punctuation 
newCol <- gsub("[[:punct:][:digit:]]+", "", newCol)

newCol <- gsub(pattern="\\W", replace = " ", newCol)
newCol <- gsub(pattern="\\d", replace = " ", newCol)

#load tm
library(tm)

#remove stopwords
newCol <- removeWords(newCol, stopwords())

#remove words with length of 1 
newCol <- gsub(pattern="\\b[A-z]\\b{1}", replace =" ", newCol)

#remove words with length of 2 
newCol <- gsub(pattern="\\b[A-z]\\b{2}", replace =" ", newCol)

#all lowercase
newCol <- tolower(newCol)

#create new data frame
newExample <- data.frame(final, newExample$cylinders)

caDataCleaned <- data.frame(newCol)

#split dataset to two files
fileOne <- caDataCleaned$newCol[1:500]
fileTwo <- caDataCleaned$newCol[501:1000]

#change them to characters 
fileOne <- as.character(fileOne)
fileTwo <- as.character(fileTwo)

print(fileOne)
print(fileTwo)

#print to file - make sure to refence the column

write.table(fileOne, "fileOne.txt", sep=" ", append= FALSE, quote = FALSE, row.names = FALSE)
write.table(fileTwo, "fileTwo.txt", sep=" ", append= FALSE, quote = FALSE, row.names = FALSE)










