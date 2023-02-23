### practicing using lubridate with data from Becker and Silbiger (2022)
### Created by: Nicole Ayala
### Created on: 2023-02-23
#####################################################################
### Load libraries #######
library(tidyverse)
library(here)
library(lubridate)

##### Loading Data ####
now() # tells us what time it is right now
now(tzone = "EST") # tells us what time it is in the east coast
now(tzone = "GMT") # tells us what time it is in greenwich mean time
today() # only if you want the date and no time :)
am(now()) # ask if it is the morning?
pm(now()) # ask if it is the night?
ymd() # year month day
mdy() # month day year
dmy() # day month year

### Dates must be characters NOT factors! ###

mdy("02/23/2023")   # month day year
mdy("February 23 2023") # month day year written

### Date and Time ###
ymd_hms("2021-02-23 13:14:20 PM") # year month day hour minute second
mdy_hms("02-23-2023 1:15:35 PM") # month day year hour minute second
mdy_hm() # month day year hour minute

### making a vector of dates via character string ###
# make a character string
datetimes<-c("02/22/2023 22:22:20",
             "02/23/2023 11:21:10",
             "02/24/2023 8:01:52") # a series of dates and times on one line of code

# convert to datetimes
datetimes <- mdy_hms(datetimes)
month(datetimes, label = TRUE, abbr = FALSE) # put abbreviate as FALSE lets me spell it out
day(datetimes) # extract all days
wday(datetimes, label = TRUE) # extract a certain day of the week
hour(datetimes) # tells me the hours
minute(datetimes) # tells me the minutes
second(datetimes) # tells me the seconds


### add extra hours, years, days, minutes, seconds to datetimes ###
datetimes + hours(4) # this adds 4 hours
datetimes + days(4) # this adds 4 days later to each of your intiial dates
datetimes + seconds(4) # this adds 4 secodns to each day

### rounding dates ###
round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minutes

