#PULL DATA FROM: https://www.cleartrip.com/trains/stations/list
#Other methods----
con = url("https://www.cleartrip.com/trains/stations/list")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
html <- htmlTreeParse(url,useInternalNodes=T)
xpathSApply(html,"//title",xmlValue)
#----


#WEB-SCRAPING
install.packages("httr")
library(httr)
url <- "https://www.cleartrip.com/trains/stations/list"
html2=GET(url)
content2=content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

install.packages("rvest")
library(rvest)
setwd("~/Downloads/India Railroad Station HTML")
ldf <- list() # creates a list
listhtm <- dir(pattern = "*.htm") # creates the list of all the csv files in the directory
for (i in 1:length(listhtm)){
  ldf[[i]] <- read_html(listhtm[i])
}
for (i in 1:5) {
  View(ldf[[i]])
}
#https://stackoverflow.com/questions/5758084/loop-in-r-to-read-many-files

url1 <- "https://www.cleartrip.com/trains/stations/list?page=1"
webpage <- read_html(url1)
citycode_html <- html_nodes(webpage, 'td:nth-child(1)')
citycode <- html_text(citycode_html)

station_html <- html_nodes(webpage, 'td:nth-child(2)')
station <- html_text(station_html)

location_html <- html_nodes(webpage, 'td:nth-child(3)')
location <- html_text(location_html)


url2 <- "https://www.cleartrip.com/trains/stations/list?page=2"
webpage <- read_html(url2)
citycode_html2 <- html_nodes(webpage, 'td:nth-child(1)')
citycode <- append(citycode, html_text(citycode_html2), after=length(citycode))


glimpse(citycode)
glimpse(station)



#GEOCODING
#Location of Train Stations

#Location of Towns



#Data Cleaning
#rbind()
#cbind()
#gsub()
#substring()
#arrange()
#select()
#lubridate()
##cnames <- c("patient", "age", "weight", "bp", "rating","test")
##colnames(my_data) <- cnames

#Dates & Times: https://www.coursera.org/learn/r-programming/lecture/yl7BO/dates-and-times


#DATA CLEANING----
library(datasets)
s <- split(airquality, airquality$Month)
str(s)

#Removing NA values: complete.cases()
#https://www.coursera.org/learn/r-programming/lecture/Qy8bH/subsetting-removing-missing-values

columnmean <- function(y, removeNA = T) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
}



#Factor Variables
#https://www.coursera.org/learn/r-programming/lecture/Eidkq/data-types-factors
#dput() and dump(): https://www.coursera.org/learn/r-programming/lecture/qFvzp/textual-data-formats

#How do we use R to tackle big data?: https://rviews.rstudio.com/2019/07/17/3-big-data-strategies-for-r/


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

#----



#Generating Factors/Categories
#factors()
#gl()
