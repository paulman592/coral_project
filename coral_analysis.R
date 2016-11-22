## Nursery Expansion Data
## R Script for Analysis of TLE and Apical Tip Data
## Collected at CCMI Nurseries, Little Cayman, Cayman Islands

#import packages
library(car)
library(dplyr)
library(nlme)
library(ggplot2)
library(RSQLite)

# Link database
## connect to database and create tibble
portal_db <- src_sqlite("Nursery_Measurements_Sept_9.sqlite")
nursery_db <- tbl(portal_db,"Nursery_Measurements_R_Sept_9")

query <- 'SELECT Month, Type, No, Site, AVG(TLE) AS AVGTLE FROM Nursery_Measurements_R_Sept_9 AS m
          WHERE m.TLE != "NA" OR m.TLE IS NOT NULL
          GROUP BY Month, Type, Site, No
          ORDER BY Month DESC'
avgTLE_by_factors <- tbl(portal_db, sql(query)) #run sql query
TLE_by_factors_df <- data.frame(avgTLE_by_factors) #convert to DF
TLE_by_factors_df
