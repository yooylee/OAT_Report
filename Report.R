# 1. Set your working directory

# 2. Load your file

OATData <- read.csv("YourFileName.csv", header = TRUE)

# 3. Libraries
library(plyr)

# 4. From Entire Records

### 1) Total number of completed items

completed_items <- OATData[ which(OATData$Status=="Yes"), ]

completed_items_total <- nrow(completed_items)
completed_items_total # This will give you the total number of completed items

### 2) Total number of completed items by Outcome value

outcome <- count(completed_items$Outcome)
outcome # This will give you the total number of completed items by Outcome value

### 3) Total number of notifications sent

first_email <- OATData[ which(!(is.na(OATData$`1st Email`))), ]
first_email_total <- nrow(first_email)

second_email <- first_email[ which(!(is.na(first_email$`2nd Email`))), ]
second_email_total <- nrow(second_email)

last_email <-second_email[ which(!(is.na(second_email$`3rd Email`))), ]
last_email_total <- nrow(last_email)

email_total_sent <- first_email_total + second_email_total + last_email_total
email_total_sent # This will give you the total number of notifications sent

# 5. Department

### Filter records by department first
### Example: Department of Medicine, School of Medicine
Medicine <- OATData[ which(OATData$Department=="Department of Medicine, School of Medicine"), ]

### Then apply same logic above to count the total number of completed items, 
### the total number of completed items by Outcome value and the total number of notifications sent

# 6. Time range

### If you want to do withim time ranges, apply another condition like this:
time_ranges <- subset(completed_items, `1st Email` > "2017-05-30" & `1st Email` < "2017-06-13")