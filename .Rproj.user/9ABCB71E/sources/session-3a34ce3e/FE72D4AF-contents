# ==============================================================================
# Goal: Make connection to a Database
# ==============================================================================

if (!require("odbc"))   install.packages("odbc")    # Driver to create the connection to database
if (!require("DBI"))    install.packages("DBI")     # Functions to read/write to database
if (!require("dplyr"))  install.packages("dplyr")  # Functions to make queries using `dplyr` function format
if (!require("dbplyr")) install.packages("dbplyr")  # Functions to make queries using `dplyr` function format
source('Reused-Code/Credentials.R')           # 

# Sources for reading and writing to database easily:
  # Querying from database (3 methods): https://db.rstudio.com/getting-started/database-queries
  # Writing to database and schema: https://db.rstudio.com/best-practices/schema/
  # Querying like you are using `dbplyr` package: https://dbplyr.tidyverse.org/articles/dbplyr.html


# Create Database Connection
database <- dbConnect(odbc(), 
                          Driver    = "ODBC Driver 18 for SQL Server", # Download driver: https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver15
                          Server    = "", 
                          Database  = "", 
                          UID       = ,
                          PWD       = ,
                          TrustServerCertificate = 'Yes')


# Read data                                     # Connection using `dbplyr`:
con_example <- tbl(database,                    # The database
                   in_schema(schema = 'dbo',    # The schema
                             table  = ''))      # The table

df_example <- data.frame(con_example) # Locally store the FULL table
rm(con_example)                       # Remove for this case, but note you could keep as pointer
