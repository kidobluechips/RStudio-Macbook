library(ggplot2)
library(magrittr) #For pipes
library(xlsx)

#Introduction to R----

#Version Control & Github: https://www.coursera.org/learn/data-scientists-tools/home/week/3


browseVignettes("ggplot2")
#How to create PDFs/Powerpoints directly from R code?
#R Markdown!!!
install.packages("rmarkdown")

#Factor Variables
#https://www.coursera.org/learn/r-programming/lecture/Eidkq/data-types-factors

#How do we use R to tackle big data?
#https://rviews.rstudio.com/2019/07/17/3-big-data-strategies-for-r/

#dput() and dump(): https://www.coursera.org/learn/r-programming/lecture/qFvzp/textual-data-formats

#Interfaces beyond using read.csv or read.table
#file, gzfile, bzfile, url: https://www.coursera.org/learn/r-programming/lecture/pSHGL/connections-interfaces-to-the-outside-world
#We can type str(file) to obtain structure of the function "file". Just as helpful as ? file

#Subsetting Lists: Double subsetting for lists that are elements x[[1]][[2]] (second element of first element, which is a list)
#https://www.coursera.org/learn/r-programming/lecture/hVKHm/subsetting-lists

#Removing NA values: complete.cases()
#https://www.coursera.org/learn/r-programming/lecture/Qy8bH/subsetting-removing-missing-values

columnmean <- function(y, removeNA = T) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
}

#Dimension and Attributes of Dataset/Vector
#dim()
#attributes()
#Using class() to check the nature of the data or if it's a vector/matrix is helpful too.

#Data Cleaning
#rbind()
#cbind()
#head() & tail()
##cnames <- c("patient", "age", "weight", "bp", "rating","test")
##colnames(my_data) <- cnames

#Dates & Times: https://www.coursera.org/learn/r-programming/lecture/yl7BO/dates-and-times

#Not Coercing Data into a Matrix:
#data.frame() is better because matrix can contain only one class of data
#Test the dataframe created with class() to see it is not a matrix

#Scoping and Environments: https://www.coursera.org/learn/r-programming/lecture/lYHLU/scoping-rules-symbol-binding
#REALLY IMPORTANT FOR UNDERSTANDING FUNCTIONS: https://www.coursera.org/learn/r-programming/lecture/FkTgn/scoping-rules-r-scoping-rules
#Lexical vs. Dynamic Scoping

#Writing Functions and Debugging - https://www.coursera.org/learn/r-programming/lecture/tfSUs/debugging-tools-basic-tools
#traceback, profiler, debugger
#traceback: prints out the function call stack after an error occurs; does nothing if there's no error
#debug: flags a function for "debug" mode which allows you to step through execution of a function one line at a time
#browser: suspends the execution of a function wherever it is called and puts the function in debug mode
#trace: allows you to insert debugging code into a function at specific places
#recover: allows you to modify the error behavior so that you can browse the function call stack

#Profiling: https://www.coursera.org/learn/r-programming/lecture/iaPrN/r-profiler-part-2
#system.time()
#Rprof()
#summaryRprof()
#by.total & by.self

#str(): https://www.coursera.org/learn/r-programming/lecture/Wc1F6/the-str-function
#Can be used to understand functions, not just data.

#lapply & sapply: https://www.coursera.org/learn/r-programming/lecture/t5iuo/loop-functions-lapply


#Projects not Currently Under Version Control: https://www.coursera.org/learn/data-scientists-tools/lecture/wbfrX/projects-under-version-control

#----





#Running Simulations----

#Generating Random Numbers: https://www.coursera.org/learn/r-programming/lecture/Q2xkZ/simulation-generating-random-numbers
#sample()

#----


#DATA CLEANING----
library(datasets)
s <- split(airquality, airquality$Month)
str(s)

#Generating Factors/Categories
#factors()
#gl()

#Lists and Dataframes (the latter are lists of columns of different types); row.names in dataframes
#Names Attribute: https://www.coursera.org/learn/r-programming/lecture/nIcOc/data-types-names-attribute
#Using $ to extract values by name from a named list
#Using Factors: https://www.coursera.org/learn/r-programming/lecture/Eidkq/data-types-factors
#read.table (space as separator), read.csv (commas as separator): https://www.coursera.org/learn/r-programming/lecture/bQ5B9/reading-tabular-data

#class() #Gives me the variable type
#rename()

#Parameters for read.table, read.csv
#quote
#na.strings
#nrows
#skip

library(xlsx) #https://www.coursera.org/learn/data-cleaning/lecture/c4Oc9/reading-excel-files
cameraData <- read.xlsx("./data/cameras.xlsx",sheetIndex=1,header=T)
#write.xlsx #XLConnect package (XLConnect Vignette to learn more)

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl") #set to "curl" when using Mac
list.files("./data")
dataDownloaded <- date()

#XML: https://www.coursera.org/learn/data-cleaning/lecture/cieIu/reading-xml
#httpL//www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

#JSON: https://www.coursera.org/learn/data-cleaning/lecture/eDrOh/reading-json

#data.table: https://www.coursera.org/learn/data-cleaning/lecture/trMZ7/the-data-table-package

#----


