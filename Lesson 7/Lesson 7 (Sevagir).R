#|--------------------------------------------------------------------------|
#|          Conditions and Loops -  Chapter 10                              |
#|             Writing Functions -  Chapter 11                              |
#|           Exceptions, Masking -  Chapter 12                              |
#|--------------------------------------------------------------------------|

#----------------------- Break -------------------------

x <- -5:5
m <-NULL
for(i in 1:10){
  
  while(is.finite(5/x[i])){
    
    m[i] <-  5/x[i]
    
    i <- i+1 
  }
  
}

m

y <- NULL
for(i in 1:11){

  if( is.finite(5/x[i]) ){
    
    y[i] <-  5/x[i]
    
  }else{
    
    break
    
  }  
}
y

y <- NULL
for(i in 1:11){
  
  if( is.infinite(5/x[i]) ){
    
    break
    
  }else{
    
    y[i] <-  5/x[i]
    
  }  
}
y

#---------------------- Next ----------------------

n <- NULL
for(i in 1:11){

  if(is.infinite(5/x[i])){ # be attentive

    next

  }
  
  n[i] <-  5/x[i]
}
n

n <- NULL

for(i in 1:11){
  
  if(is.finite(5/x[i])){ # be attentive
    
    n[i] <-  5/x[i]
    
  }else{
    next
  }
  
}
n

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

#-------------------- Repeat ------------------------
x <- 1
repeat {

    print(x)

    x = x+1
  
    if (x == 6){
    
      break
  }
}

#vs

x <- 1

repeat {

    print(x)
  
  if (x == 6){
  
      break
  }
  
  x = x + 1
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


#=============== Writing Functions ========================

fibFun <- function(){
  a <- 1
  b <- 1
  cat(a, ", ", b , ",", sep = "")
  repeat{
    
    fib <- a+b  
    a <- b 
    b <- fib
    cat( b , "," , sep = "")
    if(b >=145){
      cat("Break")
      break
    }
    
  }
  
}
ls()
fibFun()  

#------------------  Adding arguments --------

fibFun1 <- function( cutofvalue = 145 ){
  a <- 1
  b <- 1
  cat(a, ", ", b , ",", sep = "")
  repeat{
    
    fib <- a+b  
    a <- b 
    b <- fib
    cat( b , "," , sep = "")
    if(b >= cutofvalue){
      cat("Break")
      break
    }
    
  }
  
}

fibFun1(900) # positional matching

# ---------------------- Returning Results ----------

fun1 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  cat(z, ",", z +1)
  }
obj0 <- fun1()
obj0


fun2 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  return(z)
  
}
obj1 <- fun2()
obj1

# ---- Using return -----

fun3 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  y = 4:8 # <- also
  
}
fun3(5)
obj0 <- fun3(5) 
obj0 

fun3.1 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  y = 4:8
  return(z)
  
}
fun3.1(5)
obj1 <- fun3(5)
obj1

fun3.2 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  return(z)
  y = 4:8
  return(y)
  
}

(ret1 <- fun3.2())

# But 

fun3.3 <- function(x = 5){
  
  z = sin(x) + (cos(x))^2
  z
  y = 4:8
  y
  
}

(ret2 <- fun3.3())

# ---- Arguments -----
# Missing arguments

fun3.4 <- function(x = 5, second){
  if(missing(second)){
    return("second was missing") # True if not found 
  }else{
    return(second + x)
  }
}
fun3.4(5)
fun3.4(5,1)

# Dealing with ellipses

fun3.5.1 <- function(x = 5, ...){
  
  z = sin(x) + (cos(x))^2
  
  return(c(z,...))
  
}
fun3.5.1(5, 5, 5, 6)

# -------- Specialized Functions ---------
# 1. Helper functions
# 2. Disposable functions 

apply(matrix(c(1,2,3,4), ncol = 2), MARGIN=2,
  FUN = function(x){sum(x)^2}) 

# 3. Recursive functions

myfibrec <- function(n){
  
  if(n==1||n==2){ return(1) 
  } else {
      return(myfibrec(n-1)+myfibrec(n-2))
  } 
  
  }
myfibrec(2) 

myfibrec(-1)

# ================ Exceptions and Visibility =======================

# === Error and Warning

functionWithWarning <- function(x){
  
  if(x==0){ 
    warning("'x' is 0 but setting it to 1 and continuing")
    x <- 1
    } 
  
  return(5/x)
}

functionWithWarning(0)


functionWithError <- function(x){ 
  if(x==0){
        stop("'x' is 0... TERMINATE") 
  } 
  return(5/x) 
  }

functionWithError(0)

# Example of Fibonachi

myfibrec1 <- function(n){
  if(n<0){
    warning("n must be positive") 
    n <- n*-1 
    } else if(n==0){
      stop("'n' cannot be 0") 
      }
  
  if(n==1||n==2){ return(1) 
  } else {
    return(myfibrec(n-1)+myfibrec(n-2))
  } 
  
}
myfibrec1(-3) 

# === try Statements
myfibrec(0)
try(myfibrec(0),silent=TRUE)

myfibvector <- function(nvec){
  nterms <- length(nvec) 
  result <- rep(0,nterms) 
  for(i in 1:nterms){
    result[i] <- myfibrec(nvec[i]) 
  }
  return(result)
}
myfibvector(c(1,2,3,4))
myfibvector(c(-1,1,2,3,4))


myfibvector1 <- function(nvec){
  nterms <- length(nvec) 
  result <- rep(0,nterms) 

  for(i in 1:nterms){
    att <- try(myfibrec1(nvec[i]), silent = T)
    if(class(att)!="try-error"){

      result[i] <- att
    }else{
      result[i] <- NA  
    }
    
  }
  return(result)
}

myfibvector1(c(0,1,2,3,4))

#  Masking

search()
detach("package:tseries", unload = TRUE)
detach("package:aTSA", unload = TRUE)

library(aTSA) 
library(tseries)
search()


(newdf <- data.frame(name = c("Lusine", "David" ),
  age = c(24, 25), 
  gender = c("F", "M") ))

attach(newdf)
search()

newdf$name
name

(newdf2 <- data.frame(name = c("L", "Z" ),
  age = c(24, 26), 
  gender = c("F", "M") ))

attach(newdf2)
detach(newdf2)

