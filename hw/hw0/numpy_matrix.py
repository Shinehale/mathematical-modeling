import numpy as np
## defination of the matrix
n = np.array([[1, 2], [2, 3]])

## add or sub operation
a = np.array([[1, 2, 3], [4, 5, 6]])
b = np.array([[7, 8, 9], [4, 5, 6]])
aplusb = a + b
aminusb = a - b

## multiple operation
e = 3 * a

## np.dot() inner product
dote = np.dot(n, n)

## np.multiply() or '*' ==> element-wise-product
dote2 = a * b

## np.transpose ==> make the matrix transpose
t0 = np.transpose(a)
t1 = a.T
# print(t0, t1)

## inverse matrix ==> have the inverse of the matrix
inv = np.linalg.inv(n)
# print(inv)

## determinant of the matrix
d = np.linalg.det(n)
# print(d)

## rank of the matrix
r = np.linalg.matrix_rank(n)
print(r)