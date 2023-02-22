A <- matrix(1:10, nrow=5)# ------------------------70. Matrix------------------------
A
class(A)
nrow(A)
ncol(A)
dim(A)

B  <- matrix(11:20, ncol=2)
B
class(B)
nrow(B)
ncol(B)
dim(B)

C <- matrix(1:8, nrow=2)# ------------------------71. Matrix-By-Row------------------------
C
D <- matrix(1:8, nrow=2, byrow=TRUE)
D

diag(4) # ------------------------72. Matrix-Diagonal------------------------
diag(c(1, 5, 2, 3, 2))

A <- matrix(1:10, ncol=2) # ------------------------73. Matrix-to-Vector------------------------
A[c(1, 3, 4), ]

A[2, ]
class(A[2, ])
class(A)
is.vector(A[2, ])
is.matrix(A[2, ])

A[, 1]
A
class(A[, 1])
is.vector(A[, 1])
is.matrix(A[, 1])

A[, 1:2]
A[c(1, 3, 4), 1:2]

A[2, ] # ------------------------74. Matrix-Drop-False------------------------
A[2, , drop=FALSE]
class(A[2, , drop=FALSE])
is.vector(A[2, , drop=FALSE])
is.matrix(A[2, , drop=FALSE])

A[, 1]
A[, 1, drop=FALSE]
class(A[, 1, drop=FALSE])


A[1:2, ]
A[1:2, , drop=FALSE]

A[c(1, 2, 4), 1]
A[c(1, 2, 4), 1, drop=FALSE]

dim(A)# ------------------------75. Matrix-Element-Wise-Operations------------------------
dim(B)

A
B

A + B
A - B
A * B
A / B

A == B
A >= B
A <= B


dim(C)

A + C
A * C

A # ------------------------76. Matrix-Multiplication------------------------
C

# nxp : pxC --> nxc

A %*% C

A %*% B

A %*% D

A # ------------------------77. Matrix-Transpose------------------------
t(A)
t(C)
t(t(A))

array1 <- array(1:5, dim=5) # ------------------------78. Arrays------------------------
array1
class(array1)
dim(array1)

array2 <- array(1:15, dim=c(5, 3))
array2
dim(array2)
class(array2)
is.matrix(array2)
is.array(array2)


array3 <- array(1:60, dim=c(5, 3, 4))
array3
dim(array3)
class(array3)
