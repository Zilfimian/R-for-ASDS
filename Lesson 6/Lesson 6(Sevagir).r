#|--------------------------------------------------------------------------|
#|          Conditions and Loops -  Chapter 10                              |
#|--------------------------------------------------------------------------|

#=====  if Statement  ======
## Stand-alone statement

if(5 <= 10){
  print("The tested condition is true")
}

if(5 >= 10){
  print("The tested condition is true")
}

# Variable scope
a <- 15

if(5 <= 10){
 a = 26
}

a

# + sign: R is expecting more input before it begins execution.
# left brace is opened
if(4 <=10)#{
  print("something")

# more complicated if statement

(YoB <- c(1995, 1996, 1997, 2000, 1990, 1969))

if( any((YoB + 2) >= 1998) ){
  cat("Condition satisfied --\n")
  paste( sum(YoB>=1996), "of all are from Generation Z" )
}

if( any(YoB < 1996) || all(YoB==1969) ){
  paste( "Generation Y") 
}

# Design is free :]

## Else statements

# If condition is false:

x1 <- "A"
y1 <- "B"

if( x1 > y1 ){
 paste("The condition is true, because", x1, "is placed left of", y1)  
}else{
 paste("The condition is false, because", x1, "is placed left of", y1)  
}

## Ifelse for element-wise check
# If - single logical value 

if(c(T,F,T)){
  print(5)
}

if(c(F,F,T)){
  print(5)
}

# shortcut function ifelse

ifelse(c(T,F,T), 5, "Error")

x2 <- 2
y2 <- -4:4   

ifelse(test = y2 %/% 2 == 0, yes = "Undefined", no = y2/0)

## Nesting and Stacking Statements

# Nesting
YoB
(gender <- rep(c("F", "M"), length(YoB)))

if(YoB[3] > 1996){
  cat("---- This is Generation Z --- \n")
  if(gender[3] == "M"){
    "Gen Z: Boy"
  }else{
    "Gen Z: Girl"
  }
}else{
  paste("We are from generation Y")
}

# Stacking
if(YoB[3] > 1996 && gender[3] == "M"){
  cat("---- This is Generation Z --- \n")
  paste("Gen Z: Boy")
}else if(YoB[3] > 1996 && gender[3] == "F"){
  "Gen Z: Girl"
}else{
  paste("We are from generation Y")
}


## Switch function

# Choose which code to run based on the value of a single object

my_name = "Lusine"
if( my_name == "Lusine"){

    YoB1 <- 1995 

    }else if(my_name == "David"){ 
    
    YoB1 <- 1994 
      
    }else if(my_name == "Mariet"){ 
  
    YoB1 <- 1998
        
    }else if(mystring=="Shoghakat"){ 

    YoB1 <- 1990
      
    }else{
                      
    YoB1 <- NA }
YoB1

#EXPR -numeric or a character string

switch(EXPR = my_name, Lusine = 1995, David = 1994, Mariet = 1998, Shoghakat = 1990, NA)

switch(EXPR = "Aram", Lusine = 1995, David = 1994, Mariet = 1998, Shoghakat = 1990, NA)

# Numeric version works in different way

switch(EXPR = 3, 12, 34, 56, 78, NA)  # determined purely with positional matching

switch(EXPR = 4, 12, 34, 56, 78, NA)

x11 <- switch(EXPR = 0, 12, 34, 56, 78, NA)
x11

x12 <- switch(EXPR = 15, 12, 34, 56, 78, NA)
x12

# Drawbacks - multiple conditions

#=================== Coding Loops =========================

# ==== For (loopindex, loopvector) ====

for(i in 1:3){ 
  print(paste("The current iteration is", i))
  }

count <- 6

for(i in 1:5){
  count <- count + 1
  cat("Interation", i, "element", count, "\n")
  }

# indexes of a vector

for(i in c(0.27, 1995, 0.8, 8)){
  print(i)
}


for(i in 1:length(c(0.27, 1995, 0.8, 8))){
  print(c(0.27, 1995, 0.8, 8)[i])
}

for(i in 1:length(c(0.27, 1995, 0.8, 8))){
  print(i)
}

# Assignment
# Create a list, use for loop to check whith element of list is vector
# Return vectors
(list_my <- list(str = "Single string",
  vec1 = rep(x = c(1,2), times = 3),
  mat = diag(4),
  arr = array(diag(27), dim = c(3,3,3)),
  vec2 = c("f", "m", "f","f", "m", "f" )
  ))
names(list_my)

for(i in 1:length(list_my)){
  if(is.vector(list_my[[i]])){
    print(list_my[[i]])
  }
}

# If character

for(i in 1:length(list_my)){
  if(is.vector(list_my[[i]]) & typeof(list_my[[i]]) == "character"){
    print(list_my[[i]])
  }
}

# If length != 1

for(i in 1:length(list_my)){
  if(is.vector(list_my[[i]]) & typeof(list_my[[i]]) == "character" & length(list_my[[i]])!=1){
    print(list_my[[i]])
  }
}

# Nesting for Loops 

# the inner loop is executed in full before the outer loop loopindex is incremented

# inner loop - outer loop
mat <- matrix(NA, nrow = 5, ncol = 3)

for(i in 1:5){
  for(j in 1:3){
    mat[i,j] <- c(1,0,1,0,1)[i] * c(5,4,6)[j]
  }
}

mat

# ==== While loops ====

# A while loop runs and repeats while a speciﬁed condition returns TRUE
# single logical-valued loopcondition 

x = 1

while(x <= 5){ 
  cat("x (before) is ", x, "\n")
  cat("Condition is", x < 10, "\n") 
  x <- x + 1
  cat("x (after) is", x, "\n")
}

## Looplike functions 

# Implicit Looping with apply

# sum of rows

(mat_my <- matrix(1:8, nrow = 4))
rowSums(mat_my)

# with for loop
row.tot = NA

for(i in 1:4){
  row.tot[i] <- sum(mat_my[i,])
}

row.tot

# with apply (matrix of df)

apply(X = mat_my, MARGIN = 1, sum)
apply(X = mat_my, MARGIN = 2, sum)

apply(X = array(mat_my, dim=c(2,2,2)), MARGIN = 3, sum)

sum(array(mat_my, dim=c(2,2,2))[,,1])
sum(array(mat_my, dim=c(2,2,2))[,,2])

apply(X = array(mat_my, dim=c(2,2,2)), MARGIN = 3, diag)

# tapply 
data(mtcars)
str(mtcars)
mtcars$vs <- factor(mtcars$vs, levels = c(0,1), labels = c("V-shaped", "straight"))
table(mtcars$vs)
table(mtcars$am)
mtcars$am <- factor(mtcars$am)
tapply(X = mtcars$mpg, INDEX = mtcars$vs, FUN = mean)
tapply(X = mtcars$mpg, INDEX = list(mtcars$vs, mtcars$am), FUN = mean)

apply(mtcars, MARGIN = 2, FUN = mean)

# lapply -  can operate member by member on a list (return list)

x <- c(1,2)
lapply(x, is.vector)

list_my # recall
lapply(list_my, is.vector)

# sapply - the same result in arrays
sapply(list_my, is.vector)

# =============== Break ======================
x <- -5:5
y <- NULL
for(i in 1:10){

  if( is.finite(5/x[i]) ){
    y[i] <-  5/x[i]
  }else{
    break
  }  
}
y

m <-NULL
for(i in 1:10){
  
  while(is.finite(5/x[i])){
    m[i] <-  5/x[i]
    i <- i+1 
  }
    
}

m

#================== Next ======
n <- NULL
for(i in 1:10){
  
  if(is.infinite(5/x[i])){
    
    next  
    
  }
  
  n[i] <-  5/x[i]
}
n

# Inner

mat <- matrix(NA, nrow = 5, ncol = 3)

for(i in 1:5){
  for(j in 1:3){
      if(c(1,0,1,0,1)[i] * c(5,4,6)[j] == 6){
        next
      }
        mat[i,j] <- c(1,0,1,0,1)[i] * c(5,4,6)[j]
  }
}

mat

#========= Repeat =====
x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}
# Fibonachi
a <- 1
b <- 1
repeat{

  fib <- a+b  
  a <- b 
  b <- fib
  print(b)

  if(b >=145){
   cat("Break")
      break
  }
  
}
