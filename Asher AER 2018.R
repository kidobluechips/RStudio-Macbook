#Version Control & Github: https://www.coursera.org/learn/data-scientists-tools/home/week/3
#Projects not Currently Under Version Control: https://www.coursera.org/learn/data-scientists-tools/lecture/wbfrX/projects-under-version-control

library(ggplot2)
library(tidyverse)
library(magrittr) #For pipes
library(xlsx)
library(readxl)
install.packages("rmarkdown") #How to create PDFs/Powerpoints directly from R code?
#Interfaces beyond using read.csv or read.table
#file, gzfile, bzfile, url: https://www.coursera.org/learn/r-programming/lecture/pSHGL/connections-interfaces-to-the-outside-world
#We can type str(file) to obtain structure of the function "file". Just as helpful as ? file

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







#Reproducing Asher AER

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-pop-econ-census-csv/shrug-v1.4.samosa-pop-econ-census-csv")
library(dplyr)
library(tidyr)
library(pryr)

shrug_ec <- read.csv("shrug_ec.csv", stringsAsFactors = F) #Economic census data
shrug_pc01 <- read.csv("shrug_pc01.csv", stringsAsFactors = F) #Population census data 2001
shrug_pc11 <- read.csv("shrug_pc11.csv", stringsAsFactors = F) #Population census data 2011
shrug_pc91 <- read.csv("shrug_pc91.csv", stringsAsFactors = F) #Population census data 1991
#Complete demographics for every town and village in India for 1991, 2001, 2011.
#Detailed directory of public goods at the town and village level.

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-ancillary-csv/shrug-v1.4.samosa-ancillary-csv")
initial1 <- read.csv("shrug_ancillary.csv", nrows=100, stringsAsFactors = F)
classes1 <- sapply(initial1, class)
classes1 <- names(classes1)
ancillary <- read.csv("shrug_ancillary.csv", colClasses = classes1, stringsAsFactors = F)
rm(initial1)
#Working with large datasets: https://www.coursera.org/learn/r-programming/lecture/IHss1/reading-large-tables
pryr::object_size(ancillary) #Memory occupied: https://r4ds.had.co.nz/pipes.html
#Contains rural mean per capita consumption, share of households whose main source of income
#is cultivation, distance to towns of various sizes, PMGSY road data, and whether each shrid is a
#thiessen polygon or instead generated from a point.

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-nl-csv/shrug-v1.4.samosa-nl-csv")
initial2 <- read.csv("shrug_nl_wide.csv", nrows=100, stringsAsFactors = F)
classes2 <- sapply(initial2, class)
classes2 <- names(classes2)
nl <- read.csv("shrug_nl_wide.csv", colClasses = classes2, stringsAsFactors = F)
pryr::object_size(nl)
rm(initial2)
#Gridded night lights data from the National Oceanic and Atmospheric Administration (NOAA) were
#matched to village and town polygons, and aggregated into totals and means. These are available
#annually from 1992–2013.

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-vcf-csv/shrug-v1.4.samosa-vcf-csv")
initial3 <- read.csv("shrug_vcf_wide.csv", nrows = 100, stringsAsFactors = F)
classes3 <- sapply(initial3, class)
classes3 <- names(classes)
vcf <- read.csv("shrug_vcf_wide.csv", colClasses = classes3, stringsAsFactors = F)
pryr::object_size(vcf)
rm(initial3)
#Forest cover data comes from Vegetation Continuous Fields (VCF), a MODIS product that measures
#tree cover at 250m resolution from 2000 to 2014. VCF is predicted from a machine learning algorithm
#based on broad spectrum satellite images and trained with human-categorized data, which can
#distinguish between crops, plantations and primary forest cover.


glimpse(ancillary)
glimpse(nl)
glimpse(shrug_ec)
glimpse(shrug_pc91)
glimpse(shrug_pc01)
glimpse(shrug_pc11)

#Subsetting Lists: Double subsetting for lists that are elements x[[1]][[2]] (second element of first element, which is a list)
#https://www.coursera.org/learn/r-programming/lecture/hVKHm/subsetting-lists

#Lists and Dataframes (the latter are lists of columns of different types); row.names in dataframes
#Names Attribute: https://www.coursera.org/learn/r-programming/lecture/nIcOc/data-types-names-attribute
#Using $ to extract values by name from a named list
#Using Factors: https://www.coursera.org/learn/r-programming/lecture/Eidkq/data-types-factors
#read.table (space as separator), read.csv (commas as separator): https://www.coursera.org/learn/r-programming/lecture/bQ5B9/reading-tabular-data


#Dimension and Attributes of Dataset/Vector
#dim()
#attributes()
#Using class() to check the nature of the data or if it's a vector/matrix is helpful too.

#class() #Gives me the variable type
#rename()


#Plotting
browseVignettes("ggplot2")
#Generating Random Numbers: https://www.coursera.org/learn/r-programming/lecture/Q2xkZ/simulation-generating-random-numbers
#sample()


n <- 1000
r <- numeric(n)
for (i in 1:n) {
  x <- rnorm(n)
  r[i] <- mean(x)
}
r

#Instead of just using Asher’s datasets, also use Columbia’s dataset? In April.
#WRITE FUNCTIONS




#Old----
#TITLE OF STUDY: Roads and Networks of Urban Governance in Rural India
-Role of roads: As one of the variables
-Innovation and Diffusion of Urban Governance best practice
#Are there leaders in governance best practice? Diffusion of experience?
#Networks and nodes of governance
#Multiple tests of subsets based on different radiuses and "connections". Bootstrapping? How do variances of certain
#quantitative variables change? Imply different distributions in different regions?
#Movement of chiefs.
#Latent variables and ommited variables?
#Heterogeneity of Sub-Groups of census towns across regions.
#LINKS
#https://scholar.google.com/scholar?hl=en&as_sdt=0%2C21&q=urban+governance&btnG=
#https://www.oxfordscholarship.com/view/10.1093/acprof:oso/9780199270057.001.0001/acprof-9780199270057


#Are there governance issues in urban/regional transportation?
#What innovations are there in local governance structures with regards to transport? Public-private partnerships?
#Managerialism vs. Entrepreneurialism in this area?
A basic application of transport theory to "poverty transportation" in India.
#Building on "Rural Roads and Structural Transformation"
#Optimal Efficiency of roads?
#Underestimated network effect of roads leading to census towns.
Shonda: Transport and sustainability and case studies in Indian cities

#Governance Topics
#Merging of state institutions. How to isolate and identify its impact.
#Change in legislative borders. Impact on local economic activity
#Increased/decreased local autonomy and impact on public goods/service delivery
#SOE/Public enterprise vacuum in census towns. What local institutions fill that vacuum? How do they fare?
#Specifically energy utilities.
#Is fragmentation within and across census towns a result of governance?
#The electoral process.
#Accountability in Census Towns
#Inadequate political representation? Of different actors in census towns?
##(From PPT) Spatial dimension – how far to decentralize? How to link different scale levels? Within city and outside? 
##At Oxford: https://www.conted.ox.ac.uk/about/urban-governance-and-economics
##Governance of Electric Urbanism in Africa: this research explores the challenges of 
#governing electricity services in cities in Sub-Saharan Africa (Principal Researcher: Idalina Baptista)
##Informality, development and urban governance: the role of social innovation and informal forms of
#governance and leadership in low-income neighbourhoods (Principal Researcher: David Howard)



#Bibliography
###Brenner, Neil. "New State Spaces: Urban Governance and the Rescaling of Statehood."
###Kearns, Ade, and Ronan Paddison. "New Challenges for Urban Governance"
###Harvey, David. "From Managerialism to Entrepreneurialism: The Transformation in Urban Governance in Late Capitalism"
###Mercier, Tremblay-Racicot, Carrier, Duarte. "Governance and Sustainable Urban Transportation in the Americas"


#IDENTIFICATION STRATEGY
#Depends on our handle of variations in urban governance?
#Agglomeration benefits are clearly nonlinear?
#Nonlinear Regression Methods - Ch.10 in Microeconometrics Using Stata

#TIMELINE FOR PROJECT:
#Literature Review 
#Data Collection and Cleaning - Feb. 3-7: ...
#Data Collection and Cleaning - Feb. 10-14: ...
#Data Collection and Cleaning - Feb. 17-21: ...
#Data Collection and Cleaning - Feb. 24-28: ...
#Data Analytics. Choice of Models to Run - March
#Preparation of Paper - April



#USE: Ancillary dataset.

#Pseudo-code: Using shrids, identify subset of villages/towns that have two neighboring village/towns within 30km and all three
#village/towns are 50km or farther from cities (larger habitations)
#If: 
#Else: Drop
#Store as ___

#Pseudo-code: Create array. For each village/town, list first and second nearest towns/villages

#GOOGLE API
#https://cran.rstudio.com/web/packages/mapsapi/vignettes/intro.html

#Pseudo-code: Using Google Maps API, identify shortest route for each village/town combination in the above array

#Pseudo-code: Pull data on roads and find current lassification of roads.
#This could be the most difficult part. Many routes might not have matching records in the road database.

#Pseudo-code: Use historic data to create panel of road classification (illustrating how they've changed)

#Pseudo-code: Use satellite imagery to determine formal vs. informal roads.

###This allows us to render the "road variable" as an outcome variable.
#----
