import numpy as np

tot = 0
cnt = 1
for i in range(1, 21):
    cnt = cnt * i
    tot += cnt
print(tot)