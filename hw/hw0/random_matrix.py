import random as rd
import numpy as np

mat = np.random.randint(1, 30, size = 20)
mat = mat.reshape((4, 5))
print("the existing matrix is :\n {0}".format(mat))
max_value = mat.max()
max_r, max_c = np.where(mat == np.max(mat))
print("the max value of the matrix is {0}, the corresponding index is ({1}, {2})\n".format(max_value, max_r[0], max_c[0]))