import itertools

f = open('./subcomplex.out', 'w')

def calc(x):                            ## calculate the position of the x
    return (x // 3, x % 3)


def check(target):
    i = 0
    dic = {}
    check = [0 for i in range(9)]
    check[target[0]] = 1
    for i in range(0, 8):

        tup1 = calc(target[i])
        tup2 = calc(target[i + 1])

        if (tup1[1] - tup2[1]) == 0:
            dic[3] = 1
        else:
            slope = (tup1[0] - tup2[0]) / (tup1[1] - tup2[1])
            dic[slope] = 1
            if abs(slope) == 1 and abs(tup1[0] - tup2[0]) == 2:
                if check[4] == 0:
                    return False

        if abs(tup1[1] - tup2[1]) == 0 and abs(tup1[0] - tup2[0]) == 2:
                if check[(target[i] + target[i + 1]) // 2] == 0:
                    return False
        if abs(tup1[0] - tup2[0]) == 0 and abs(tup1[1] - tup2[1]) == 2:
                if check[(target[i] + target[i + 1]) // 2] == 0:
                    return False

        check[target[i+1]] = 1

            
    length = len(dic)
    if length != 7:
        return False
    return True
    

nums = [i for i in range(0, 9)]
arr = list(itertools.permutations(nums, 9))
tot = 0
for each in arr :
    if check(each):
        ans = []
        for i in range(9):
            ans.append(each[i] + 1)
        print(ans, file = f)
        tot = tot + 1
print("the tot probable cases are {0}".format(tot), file = f)
f.close()

