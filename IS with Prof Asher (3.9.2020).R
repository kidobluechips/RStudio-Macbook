setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-pop-econ-census-csv/shrug-v1.4.samosa-pop-econ-census-csv")
library(dplyr)
library(tidyr)

shrug_ec <- read.csv("shrug_ec.csv", stringsAsFactors = F)
shrug_pc01 <- read.csv("shrug_pc01.csv", stringsAsFactors = F)
shrug_pc11 <- read.csv("shrug_pc11.csv", stringsAsFactors = F)
shrug_pc91 <- read.csv("shrug_pc91.csv", stringsAsFactors = F)

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-ancillary-csv/shrug-v1.4.samosa-ancillary-csv")
ancillary <- read.csv("shrug_ancillary.csv", stringsAsFactors = F)

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-nl-csv/shrug-v1.4.samosa-nl-csv")
nl <- read.csv("shrug_nl_wide.csv", stringsAsFactors = F)

setwd("/Volumes/My Passport for Mac/SHRUG Datasets/shrug-v1.4.samosa-vcf-csv/shrug-v1.4.samosa-vcf-csv")
vcf <- read.csv("shrug_vcf_wide.csv")

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
#LINKS----
#https://scholar.google.com/scholar?hl=en&as_sdt=0%2C21&q=urban+governance&btnG=
#https://www.oxfordscholarship.com/view/10.1093/acprof:oso/9780199270057.001.0001/acprof-9780199270057
#----

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



#Bibliography----
###Brenner, Neil. "New State Spaces: Urban Governance and the Rescaling of Statehood."
###Kearns, Ade, and Ronan Paddison. "New Challenges for Urban Governance"
###Harvey, David. "From Managerialism to Entrepreneurialism: The Transformation in Urban Governance in Late Capitalism"
###Mercier, Tremblay-Racicot, Carrier, Duarte. "Governance and Sustainable Urban Transportation in the Americas"
#----


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

glimpse(nl)
glimpse(vcf)
glimpse(ancillary)
glimpse(shrug_ec)
str(shrug_pc01)
#rename()


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




