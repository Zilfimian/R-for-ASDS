
#|==============================================================================|
#|===== Dear students, as per your request I am sending this draft notes. ======|
#|===== However, I strongly  recommend you to open the book instead of this file| 
#|------------------------------------------------------------------------------|
#|                Factor -  Chapter 4                                           |
#|                Lists  -  Chapter 5                                           |
#|       Special values  -  Chapter 6                                           |       
#|------------------------------------------------------------------------------|
#|===== Sincerely and hopefully,                                          ======|
#|===== Lusine                                                            ======|
#|==============================================================================|


#=================================
#==== Non-numeric values:Factor ==
#=================================

# Factors are typically created from a numeric or a character vector 
factor(c(0,1,2,0,1))
levels(factor(c(0,1,2,0,1)))
as.numeric(levels(factor(c(0,1,2,0,1))))
unique(factor(c(0,1,2,0,1)))

(x<-c(rep("F",6), rep("M", 5)))
(xf <- factor(x))

# like a vector
xf[c(1,2,3,10)]
length(xf)
which(xf == "F")

# what is the difference? 
attributes(xf)
attributes(xf)$levels
levels(xf)

# for logical/relational operations use ""
xf == "F"

# Defining and Ordering Levels

table(xf)
condition <- c("Elementary" ,"Secondary" ,"College", "Elementary" ,"Secondary" ,"Elementary" ,"Secondary" )
condition[3] < condition[2]
ord <- c("Elementary", "Secondary", "College")
(cond2 <- factor(condition, levels = ord, ordered = T))
cond2[3] < cond2[2]
cond2[8] <- "Elementary" 
c(cond2, factor("Elementary")) # numeric
c(cond2, "Elementary") # Charancter
(cond3 <- factor(c(cond2, factor("Elementary")), levels = ord, ordered = T)) # why
(new.dat <- levels(cond2)[c(cond2, factor("Elementary"))]) # stings
newcond <- factor(new.dat, levels = ord, ordered = T)
c("A", "B", "C")[c(1,2,3,3,1)]

# Matrix & arrays cannot be filled by factors
matrix(factor(c(0,1,2,0,1)))
typeof(matrix(factor(c(0,1,2,0,1))))

# What about new level?
newcond[9] <- "University"
newcond

(newconduniver <- factor(newcond, levels = c(levels(newcond)[1:2], "Univer", levels(newcond)[3] )))
newconduniver[9] <- "Univer"

newconduniver

# all levels
xf[-c(1:6)] # still has M
(xff <- xf[-c(1:6)])

droplevels(xff)

#=================================
#======== Data frame + Lists =====
#=================================

c(1,2,TRUE)
c(1,2,"TRUE")
z <- matrix(c(1,2,TRUE, FALSE), ncol = 2)
colnames(z) <- c("a", "b")
z$a # Error

#-------------------------------------------
#---------------- Lists --------------------
#-------------------------------------------

list_my <- list(matrix(c(7,2,TRUE, FALSE), ncol = 2), c(1,2,TRUE), "name", TRUE, list(diag(3)))
length(list_my)
list_my
list_my[[2]]
list_my[[2]][1]
list_my[[c(2,1)]]
list_my[[c(1)]]
list_my[[c(1,1)]] # single value
list_my[c(1,2)]
list_my[c(2,3)] # order

# Naming

names(list_my) 
names(list_my) <- c("A", "B", "C", "C", "D")
names(list_my)
list_my$C 
list_my[[3]]
list_my

# The same result

all(list_my$A[,2] == list_my[[1]][,2] )

# Incode naming

list(vector = c(1,2,3), my_matrix = matrix(3))
names(list(first = c(1,2,3), second = matrix(3)))
x <- list(first = c(1,2,3), second = matrix(3))
names(x)[2] <- "sec"
names(x) # character but $+ without quotes
x

# Adding with new name

x$new <- list("Character", c(1,2,3))
x$new[[2]]
x$new <- list(name = "Character", f =c(1,2,3))
x$new$f
dim(list_my)

# Adding with other index
length(x)
x[[5]] <- NA
length(x)
x

#-------------------------------------------
#---------------- Dataframe ----------------
#-------------------------------------------

(newdf <- data.frame(name = c("Lusine", "David" , "Par"),
  age = c(24, 25, 25), 
  gender = c("F", "M", "F") ))

newdf$age[newdf$gender=="F"]

newdf[newdf$gender=="F",]$age

(newdf <- data.frame(name = c("Lusine", "David"), 
  age = c(24, 25, 27), 
  gender = c("F", "M") ))

# Wrong attempt to recycle 
(newdf <- data.frame(name = c("Lusine", "David"), 
  age = c(24), 
  gender = c("F", "M") ))

# Access
newdf[1,1]
newdf[1,]
newdf$name
newdf$name[1]

# Factor levels
newdf[,1]
(newdf <- data.frame(name = c("Lusine", "David"), 
  age = c(24, 25), 
  gender = c("F", "M") , 
  stringsAsFactors = F))
newdf[,1]

# Add data 
newrecord <- data.frame(name = "Parandzem", age = 24, gende = "F")
newdf <- rbind(newdf, newrecord)
newrecord <- data.frame(name = "Parandzem", age = 24, gender = "F")
(newdf <- rbind(newdf, newrecord))

# New column
newvariable <- c("YSU", "YSU", "AUA")
cbind(newdf , newvariable)

newdf$newvariable1 <- c("YSU", "YSU", "AUA")
newdf

# Logical Subsetting
newdf[newdf$gender == "F",]
newdf[newdf$gender == "F",c("name", "gender")]
newdf[newdf$age >= 25,]
newdf[newdf$gender == "F"|newdf$gender == "M",]

# Other functions 
View(newdf)
data("anscombe")
anscombe[,"x1"] == anscombe[["x1"]] # reference a data frame column 
anscombe[["x1"]] == anscombe$x1

anscombe[1]
class(anscombe[1])
class(anscombe[["x1"]]) == class(anscombe$x1)

str(anscombe)
head(anscombe)
str(anscombe)
list_my
is.vector(unlist(list_my))

#----------------------------------
#----------- Special values -------
#----------------------------------

#=====
#=INF=
#=====

is.numeric(Inf)
(x <- c(1, 2, Inf, -3, -Inf))
100^1000

# math operations ( add to or multiply )
Inf * (-9)
Inf + Inf
Inf / 25

# /Inf 
5 / Inf
5 / -Inf

# result is infinity
1/0
-1/0
Inf/0
Inf * Inf
Inf^Inf

# Checking
is.infinite(x) #  do not distinguish between positive or negative inﬁnity
is.finite(x)
0>=Inf # logical operators v

object.size(x)
x <- c(NULL, NULL)

#=====
#=NaN=
#=====

# These difficult-to-quantify special values
NaN
is.numeric(NaN)
Inf - Inf
Inf / Inf
0/0


0^0 #?
1^Inf #?

# Any math operation will result in NaN
(5-5)/0
is.nan(NaN)
!NaN
is.nan(!NaN)
# used only with respect to numeric operators

#=====
#=NA==
#=====

c("Stevey","Vai",NA,"Joe","Satriani",NA)
factor(c("Stevey","Vai",NA,"Joe","Satriani",NA)) # Why?
factor(c("Stevey","Vai","NA","Joe","Satriani","NA")) # Why?
is.numeric(NA)
is.numeric(!NA)
is.na(NA)
is.na(NaN) 


which(x=(is.na(c("Stevey","Vai",NA,"Joe","Satriani",NaN))&!is.nan(c("Stevey","Vai",NA,"Joe","Satriani",NaN))))
# how to remove
z <- na.omit(c("Stevey","Vai",NA,"Joe","Satriani",NA))
z

# calculations
25 == NaN
25 + NA


#=====
#NULL=
#=====

# Define empty entity
NULL #-[1]
NA
NaN

length(c(NA, NA))
length(c(NULL, NULL, 3))

# Comparison / math
NULL + 27
NULL < 27 # empty vector

# Dominate any arithmetics 
NULL +NA/Inf
list_my <- list(c(1,2,3), diag(3), "name", array(0))

list_my[[length(list_my)+2]] <- NA
list_my[[5]] 
list_my$K
