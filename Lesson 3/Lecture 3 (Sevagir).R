#|==============================================================================|
#|===== Dear students, as per your request I sent this draft notes.       ======|
#|===== However, I strongly  recommend you to open the book instead of this file| 
#|===== Sincerely,,                                                       ======|
#|===== Lusine                                                            ======|
#|==============================================================================|


#===============================================
#================ Matrices and arrays ==========
#===============================================
(A <- matrix(c(11, 17, 18, 25)))
(A <- matrix(c(11, 17, 18, 25), ncol = 1, nrow = 4))
(A1 <- matrix(c(11, 17, 18, 25), ncol = 2))
(A2 <- matrix(c(11, 17, 18, 25), ncol = 2, nrow = 2))
(A3 <- matrix(c(11, 17, 18, 25), ncol = 2, nrow = 4))
# Filling direction
(A4 <- matrix(c(11, 17, 18, 25), ncol = 2, byrow = T))
# Row and Column Binding
rbind(c(1,2), c(3,4), c(5,6))
is.matrix(cbind(c(1,2), c(3,4), c(5,6)))
# Same lenght!
B <- rbind(c(1,2), c(3,4,5))
# Matrix dimensions
dim(B)
dim(B)[1]
# Subsetting [row, column]
# Crete a 3x3 matrix
(C <- matrix(c(1,2,5, 3,4,5, 6,7,8), nrow = 3, byrow = F))
C[2,3]
# Row extraction 
diag(-C)
C[,3]
C[1,]
C[1:2,]
C[, c(1,3)]
diag(C)
#c[[1]]
# Omitting and overwriting
C[,-2]
C[-1,-c(2,3)]
C[c(1,3),2] <- 900
C
C[c(1,3),c(1,3)] <- c(-7,7) 
C[c(1,3),2:1] <- c(65,-65,88,-88)
diag(x = 3, ncol = 3, nrow = 4)
C%*%solve(C)
solve(C)%*%C
# Matrix operations
diag(x = 3)
diag(3)
diag(10, 3, 4) 
diag(x = 3, nrow = 4, ncol = 5)
diag(TRUE, 3) 
# Scalar Multiple of a Matrix
2*C
# Matrix Addition and Subtraction (Element-wise)
C+matrix(c(0), nrow = 3, ncol = 3)
C-matrix(c(0), nrow = 3, ncol = 3)
C*matrix(c(2), nrow = 3, ncol = 3)
# Multiplication
(A <- matrix(c(1,2,3,4,5,6,5,5,5), nrow = 3))
(B <- diag(3))
(C)
A*B
A%*%B
B%*%A
# Matrix Inversion
H <- matrix(c(1,2,3,4), ncol = 2)
H %*% solve(H)
# Multidimensional arrays
array(data=1:25,dim=c(3,4,2,2)) 
BR <- array(data=1:24,dim=c(3,4,2,5))
# Subsets, Extractions, and Replacements
BR[2,,1,]
5%%2
#===================================
#============== Logicals ===========
#===================================
(x <- F)
(z <- c(T, F, TRUE, F, TRUE))
# Relational operators
#5<>5
(2-1)<=2
1!=(2+3)
# Element-wise behaviour
c(1, 2, 3 ) == c(3,4,3)
A = B
A == B
# Logical operators
any(c(1, 2, 3 )|c(3,4,3))
all(c(1, 2, 3 )==c(3,4,3))
xor(c(1, 2, 3 ),c(3,4,3))
xor(c(TRUE, TRUE, FALSE, FALSE),
      c(TRUE, FALSE, TRUE, FALSE))
x&y
x|y
x||y
x&&y
# Logicals Are Numbers!
T+F+T
# Subsetting
x <- c(1,2,3)
y<- c(2,0,4)
x&y
x|y
myvec=c(5,6,4,7,8,9,2,15,2,100,100,10)
myvec[c(F,F,F,F,F,F,F,F,F,T)]
myvec[myvec<0] 
myvec[(myvec>0)&(myvec<1000)]
which(x=c(T,F,F,T,T))
which(x=myvec>5)
myvec[-which(x=myvec<0)]
A[A<1] <- -7
which(C>=4)
which(C>=4, arr.ind = T)
C[which(C>=10, arr.ind = T)]
