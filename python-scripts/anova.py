import csv
import scipy


file = open("../data/difference-area.csv", newline = "")
reader = csv.reader(file)

list1 = []
list2 = []
list3 = []
list4 = []
list5 = []

for row in reader:
    rowNums = list(map(float, row))
    list1.append(rowNums[0])
    list2.append(rowNums[1])
    list3.append(rowNums[2])
    list4.append(rowNums[3])
    list5.append(rowNums[4])

print(list1)
print(list5)

f, p = scipy.stats.f_oneway(list1, list2, list3, list4, list5)

print(p)