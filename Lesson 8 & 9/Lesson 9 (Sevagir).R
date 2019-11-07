#|--------------------------------------------------------------------------|
#|              Handling and Processing Strings                             |
#|   String Manipulation + stringr - Chapter 3, 4                           |
#|                           RegEx - Chapter 5                              |
#|                           Date / Time                                    |
#|--------------------------------------------------------------------------|

# -------------------- Regular Expressions -------------------------

# 1. Literal characters which are characters that match themselves
# 2. Metacharacters - any character that is not a literal character 
# 3. Sequences 
# 4. Character classes
# 5. Quantifiers
# 6. POSIX character classes

# ----------- Literal and Metacharacters ---------------------------

str <-c("Lusine1995^", "Say$1995-02(", "David.", "M*77", "M&95", "1995.27")

str_subset(string = str,  pattern = "Lusine") # literal 
# Logical OR
str_subset(string = str,  pattern = "Lusine|David|Say")
str_subset(string = "money$",  pattern = "money\\$")
str_subset(string = "money",  pattern = "money$")
str_subset(string = "^money",  pattern = "^money")

str_subset(string = "\n",  pattern = ".") # meta
str_subset(string = " ",  pattern = ".") # meta
str_subset(string = "",  pattern = ".") # meta
str_subset(string = str,  pattern = "\\.") # literal

str_subset(string = str,  pattern = "^M") # meta
str_subset(string = str,  pattern = "\\^") # meta
str_subset(string = str,  pattern = "\\$") # meta
?regex
str <- c("M", "MM", 'MEj', "Mj", "G", "km", "HM", "j")
as.vector(str_extract_all(string = str,  pattern = "M?j", simplify = T)) # meta
str_subset(string = str,  pattern = "M?") # 
str_subset(string = str,  pattern = "M*") # meta
str_subset(string = str,  pattern = "M+") # meta

# ----------- Sequences ------------------------

str_subset(string = str,  pattern = "\\d") # [0-9]
str_subset(string = str,  pattern = "\\D") # [^0-9]
str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s") # [a-zA-Z0-9]
str_subset(string = c(" ", "l ", "l"),  pattern = "\\S") # [^a-zA-Z0-9]
str_subset(string = c(" ", "l ", "l"),  pattern = "\\w") # word
str_subset(string = c(" ", "l ", "l"),  pattern = "\\W") # non-word

# ----------- Character classes ----------------

str_subset(string = str,  pattern = "[0-9]")
str_subset(string = str,  pattern = "[f-z]")
str_subset(string = str,  pattern = "[A-Z]")
str_subset(string = str,  pattern = "[aeuio]")
str_subset(string = c("AI", "ai"),  pattern = "[AEIOU]")
str_subset(string = c("ou", "lk"),  pattern = "[^aeuio]")
str_subset(string = c("ou", "19", "-"),  pattern = "[a-zA-Z0-9]")
str_subset(string = c("ou", "19", "-"),  pattern = "[a-zA-Z0-9]")
str_subset(string = c("ou", "19", "-"),  pattern = "[^0-9]")
str <- c(str, "9")
str_subset(string = str,  pattern = "[^1-9]")
str_subset(string = str,  pattern = "[tT]")

# ----------- Quantifiers ----------------------

str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s+") 
str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s*") 
str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s?") 

str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s{3}")
str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s{2,}")
str_subset(string = c(" ", "l   ", "l"),  pattern = "\\s{1,3}")


# ----------- POSIX character classes ----------

str_subset(string = str,  pattern = "[:alnum:]") # [a-zA-Z0-9]
str_subset(string = str,  pattern = "[:alpha:]") # [a-zA-Z]
str_subset(string = str,  pattern = "[:digit:]") # [0-9]
str_subset(string = str,  pattern = "[:lower:]") # [a-z]
str_subset(string = str,  pattern = "[:upper:]") # [A-Z]
str_subset(string = str,  pattern = "[:space:]") # [\f\n\r\t\v]
str_subset(string = str,  pattern = "[:punct:]")

#---
str_subset(string = c("grey", "gray"), pattern = "gr(e|a)y")
x <- "MDCCCLXXXVIII"
str_view(string = x, pattern = "CC*")

# How many wins and nominations are there?

#------------------------- Wins only ----------------------------

(m <- movies$Awards[1:20])
# Possible strings are ...



# ===========================================================
#                       Dates and Times in R               ==
# ===========================================================

Sys.Date()
as.Date('1995-08-27')
as.Date('1995/08/27')
as.Date(4, origin = "1900-01-01")

# What about this date's
as.Date('1995-27-08')
as.Date('1995-27-08', format = "%Y-%d-%m")
# %Y, %y, %d, %m, %b, %B, %a, %A
as.Date('27.08.95')
as.Date('27.08.95', format = "%d.%m.%y")
as.Date('27.AUG.95')
as.Date('27.AUG.95', format = "%d.%b.%y")
as.Date('95.August 27')
as.Date('95.August, 27', format = "%y.%B, %d")
as.Date('1995/08/27') + 15
as.Date('1995/08/27') - 15

as.numeric(as.Date('1995-08-27'))
as.numeric(as.Date('1970-01-01'))

# Extract the components of dates 
(gbd = c(Satriani = as.Date('1956-07-15'),
         Hendrix = as.Date('1942-11-27'),
         Ray=as.Date('1954-11-03')))

weekdays(gbd)
months(gbd)
quarters(gbd)
class(gbd)
seq(as.Date('2020-1-1'), by = 'days', length = 10)
seq(from = as.Date('2011-02-15'), by='2 weeks', length.out = 10)
seq(from = as.Date('2000-6-1'), to=as.Date('2000-8-1'), by='2 weeks')

# ============== Chron (chronological) =================
# Date + Time 
library(chron)

dtimes = c("2002-06-09 12:45:40","2003-01-29 09:30:40",
       "2002-09-04 16:45:40","2002-11-13 20:00:40",
       "2002-07-07 17:30:40")
class(dtimes)

(mat <- str_split(dtimes,' ', simplify = T))

(ch <- chron(dates = mat[,1], times. = mat[,2], format = c('y-m-d', 'h:m:s')  ))

dates(ch)

as.numeric(chron(dates = mat[,1], times. = mat[,2], format = c('y-m-d', 'h:m:s'))) # in days
unclass(chron(dates = mat[,1], times. = mat[,2], format = c('y-m-d', 'h:m:s')))

chron(dates = '1970-01-01', times. = "00:00:00", format = c('y-m-d', 'h:m:s')  )

as.numeric(chron(dates = '1970-01-01', times. = "00:00:00", format = c('y-m-d', 'h:m:s')))

as.numeric(chron(dates = '1970-01-02', times. = "00:00:00", format = c('y-m-d', 'h:m:s')))

as.numeric(chron(dates = '1970-02-01', times. = "00:00:00", format = c('y-m-d', 'h:m:s')))

chron(101010)
chron("2010/10/10", format= "Y/m/d")

gbd
range(gbd)
range(gbd)[2]- range(gbd)[1]
4979/7
difftime(gbd[1], gbd[2], units = "weeks")

difftime(gbd[1], gbd[2], units = "auto")

table(weekdays(gbd))
factor(format(gbd,'%Y'))

# ========================== Lubridate =================================

library(lubridate)
detach("pachage:chron")
search()

ymd_hms("2019-11-3 23:55:26") # Coordinated Universal Time
mdy_hm("07/25/13 08:32")
mdy_h("07/25/13 08")
mdy("07/25/13")
dmy("26072013")
ydm("19.20.03")

year(ymd_hms("2019-11-3 23:55:26"))
month(ymd_hms("2019-11-3 23:55:26"))
week(ymd_hms("2019-11-3 23:55:26"))
wday(ymd_hms("2019-11-3 23:55:26"))
yday(ymd_hms("2019-11-3 23:55:26"))
hour(ymd_hms("2019-11-3 23:55:26"))
second(ymd_hms("2019-11-3 23:55:26"))
minute(ymd_hms("2019-11-3 23:55:26"))

tm <- ymd_hms("2019-11-3 23:55:26")
second(tm) <- 27
tm

tz(ymd_hms("2019-11-3 23:55:26"))
meeting <- ymd_hms("2019-11-3 23:55:26", tz = "Asia/Yerevan")
with_tz(meeting, "America/Chicago")

# =============== Instant =======================

is.instant(tm)
round_date(tm, "minute")
round_date(tm, "day")
now()
am(now())
pm(now())

today()==Sys.Date()

# ============== Interval ====================

year <- ymd_hms("1995-8-27 14:08:27")
(age <- as.interval(year, now() ))

yearbetween <- ymd_hms("1996-8-27 14:08:27")
yearout <- ymd_hms("1994-8-27 14:08:27")

yearbetween %within% age
yearout %within% age

# ================ Durations ===================

dminutes(10)
ddays(5)
dyears(1)

as.duration(age)
as.duration(age) + dyears(5)

#================  Period ======================= 


minutes(1)
weeks(3)
hours(4)
months(6) + days(12)
years(1)

leap_year(2018) ## regular year
ymd(20180101) + dyears(1)
ymd(20180101) + years(1)

leap_year(2020) ## leap year
ymd(20200101) + dyears(1)
ymd(20200101) + years(1)
# Example 


sleep <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24", "2013-09-02 22:51:09",   "2013-09-04 00:09:16", "2013-09-04 23:43:31", "2013-09-06 00:17:41", "2013-09-06 22:42:27",  "2013-09-08 00:22:27"),
  rise.time = ymd_hms("2013-09-02 08:03:29", "2013-09-03 07:34:21", 
    "2013-09-04 07:45:06", "2013-09-05 07:07:17", "2013-09-06 08:17:13", "2013-09-07 06:52:11", "2013-09-08 07:15:19"), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45)))

