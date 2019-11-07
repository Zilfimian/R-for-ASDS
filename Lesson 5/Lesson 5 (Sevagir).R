#----------------------------------
#---Types, Classes & Coercion -----
#----------------------------------

# Converting from one object or data type to another is referred to as coercion. 
# Coercion

# Implicit coercion - to complete and operation

1 + TRUE
c("Lusine", 1, 5, TRUE )
c(FALSE, 1, 5, TRUE)

# Explicit coercion -  must be carried out by the user

as.numeric(c(T,F,F,T)) 
as.character(c(T,F,F,T)) 
as.numeric("32.4")
as.numeric("do not coerce me")
as.logical(as.numeric(c("1","0","1","0","0"))) 
as.double()
as.integer()
factor(x=c("male","male","female","male"))
as.numeric(factor(x=c(2,2,3,5)))
as.numeric(factor(x=c("male","male","female","male")))


x <- as.vector(matrix(data=1:4,nrow=2,ncol=2))
diag(dim(matrix(data=1:4,nrow=2,ncol=2))[1])
y <- dim(matrix(data=1:4,nrow=2,ncol=2))[1]
matrix(x,y)

as.data.frame(list(var1=c(1,2,3),var2=c(T,F,T),var3=factor(x=c(2,3,4,4,2))))
#The error occurs because the variables do not have matching lengths. 
as.data.frame( list(var1=c(3,4,5,1),var2=c(T,F,T,T),var3=factor(x=c(4,4,2,1))) )
# Object Class 
class(5.5)
class(as.integer(5.5))
class("Name")
class(TRUE)
class(factor(c("A", "B")))

# Other Data Structures 
# anything in matrix is matrix

class(matrix(data = c(T,T,F,T)))
class(matrix(data = c("T","T","F","T")))
# typeof reports the type of data contained within an object
typeof(matrix(data = c("T","T","F","T")))

# Multiple Classes
class(factor(c(0,1,2,0,1), levels = c(0,1,2), labels = c("A", "B", "C"), ordered = T))
# Is-DotObject-Checking Functions 
is.integer()
is.array()
is.character()
is.vector()
is.logical()
is.data.frame()
is.matrix()
is.vector()
# is.na - elementwise

# -
.Machine$integer.max
.Machine$double.xmax
# attributes
attributes(z)$na.action
attributes(diag(3))
attributes(diag(3))$dim
# For convenience
dim(diag(3)) # attribute-speciﬁc functions
#  explicit or implicit
dimnames(diag(3))

#=================================
#======== Data frame + Lists =====
#=================================

x <- c(1,2,TRUE)
x <- c(1,"Lusine","TRUE")
x[3] <- "TRUE"
x

(z <- matrix(c(1,2,TRUE, FALSE), ncol = 2))
colnames(z) <- c("a", "b")
colnames(z)
z
z$a

# Lists
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
## Naming
names(list_my) 
names(list_my) <- c("A", "B", "C", "C", "D")
names(list_my)
list_my$C 
list_my[[3]]
list_my
# The same result
all(list_my$A[,2] == list_my[[1]][,2] )
# incode naming
my_list2 <- list(vector = c(1,2,3), my_matrix = matrix(3)
names(list(something = c(1,2,3), other = matrix(3)))

x <- list(first = c(1,2,3), second = matrix(3))
names(x)[2] <- "sec"
names(x) # character but $+without quotes
x
# Adding with new name
x$new <- list("Character", c(1,2,3))
x$new[[2]]
x$new <- list(name = "Character", f =c(1,2,3))
x$new$f
dim(list_my)
# adding with other index
length(x)
x[[5]] <- NA
length(x)
x
is.vector(unlist(list_my))

#-------------------------------------------
#---------------- Dataframe ----------------
#-------------------------------------------

# Like list df has no restiction on the data type
# Unlike lists members must all be vectors of equal length

# Construction

(newdf <- data.frame(name = c("Lusine", "David" , "Par"),
  age = c(24, 25, 25), 
  gender = c("F", "M", "F") ))
# record - variable
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

# Dimension
ncol(newdf)
nrow(newdf)
dim(newdf)
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
newdf$age[newdf$gender=="F"]
newdf[newdf$gender=="F",]$age



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

# Functions
edit(newdf)
newdf <- edit(newdf)
# edit(), head(), tail(), str(), summary, Glimpse, class(), typeof, table()

#================================================
#============ Calling functions =================
#================================================

#9.1 Scoping
#=== Env ===
ls() # global
ls("package:stats")[1:10] # package
B <- matrix(data = c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3) # local
#  R isn’t confused by other objects or functions named data in other environments. Once the function has completed, this local environment is automatically removed.

# == Search path ==
search()
# path changes when additional libraries are loaded or data frames are attached
library(ggplot2)
search()
detach("package:ggplot2")
search()
attach(anscombe)
search()
detach("anscombe")
search()
# R returns error if you request a function or object that you haven’t defined, or use function from contributed package that you have forgotten to load
lusine()
lusine

# When we call the function, what does R do? 
matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3) 

environment(matrix) 

matrix <- function(x,y){
  x+y
}
matrix(1,2)
environment(matrix) 
rm(matrix)

# ==  Reserved and Protected Names ==
# Function, Statements
# Special, logical values

T <- 5
T
rm(T)
T

# 9.2 Argument Matching 

## Exact Matching: + order doesn’t matter,
## Positional Matching: without tags with order
args(matrix) #order of arguments of the matrix function
matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),3, T) # order
matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),3, 3, T) # byrow
## Mixed
## Dot-dot-dot

?data.frame()
?list()
?c()
args(list) # any number of data vectors
args(plot) # subfunctions

# ===================================================
# ========      Conditions and loops        =========
# ===================================================

# If statements
# Stamd-Alone Statement
x <- c(1,2,3)
y <- c(4,5,3)

#  This condition must be an expression that yields a *single logical* value (TRUE or FALSE)

if(x == y) {
  5
}

if(any(x == y)) {
  5
}

if(all(x == y)) {
  5
}

if(any(x == y)) {
  x = 6
}

if(any(x == y)) {
  x = 7
}

x
# + sign -?
# More complicated example

# Else statement
if(any(c(5,6) == c(6,5))){
  "This is the ouput of TRUE case"
}else{
  "This is the ouput of False case"
}

if(any(c(5,5) == c(6,5))){
  "This is the ouput of TRUE case"
}else{
  "This is the ouput of False case"
}
a = 5
b = T
if(a >= b){
  paste("Condition is ", a>=b, "--- T") 
}else{
  paste("Condition is ", a>=b, "--- F") 
}

# Using ifelse for Element-wise Checks 
# An if statement can check the condition of only a single logical value. 

if(c(FALSE,TRUE,FALSE,TRUE,TRUE)){}
# ifelse for  vector-oriented check 
y <- -100:10
ifelse(test=y<=0, yes=-1, no=1) 

# Nesting 
x = 5
if (x <= 0) {
  if(x == 0){
    print("Zero")  
  }else{
    print("Negative number")  
  }
}else{
  print("Positive number")
} 

# Stacking 
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else{  print("Zero")}

# more complicated example.
