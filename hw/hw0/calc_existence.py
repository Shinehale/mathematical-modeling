import numpy as np
import itertools as iter

f = open('./calc_existence.out', 'w')
def check(lis):
    sum_inv = 0
    for i in range(7):
        for j in range(i, 8):
            if (lis[i] > lis[j]):
                sum_inv += 1
    return False if (sum_inv % 2) else True


nums = [i for i in range(1, 9)]
arr = list(iter.permutations(nums, 8))
tot = 0
for each in arr:
    if check(each):
        tot += 1
        print(each, file = f)
print("the tot probable cases are {0}".format(tot), file = f)

