L = 100
tot = 0
for i in range(10):
    tot += L
    L = L / 2.0
print("the total distance is {0}, the 10th bounced height is {1}".format(tot, L))