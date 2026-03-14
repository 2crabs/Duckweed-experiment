#This code duplicates a csv file but applies the function areaFromPixels() to each element in the csv file
import csv

#applied to each number in csv file
def areaFromPixels(x):
    return round(x * (900/27704), 1)


fileRead = open("../data/difference.csv", newline = "")
fileWritten = open("../data/difference-area.csv", mode="w", newline = "")

reader = csv.reader(fileRead)
writer = csv.writer(fileWritten)

for row in reader:
    writer.writerow(map(areaFromPixels, map(int, row)))

fileRead.close()
fileWritten.close()