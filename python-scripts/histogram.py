import csv

#TODO: Figure out format for lilaq bar graph

fileRead = open("../data/red-areas.csv", newline = "")
fileWritten = open("../data/red-hist.csv", mode="w", newline = "")
reader = csv.reader(fileRead)
writer = csv.writer(fileWritten)

readData = []

for row in reader:
    for col in row:
        readData.append(int(col))

print(min(readData))
print(max(readData))

startBin = 27000
binWidth = 200
numBins = 8

binArray = []
testNums = [1001, 1050, 1650, 1432]

for i in range(numBins):
    binArray.append([startBin + (i * binWidth), 0])

for num in readData:
    aboveFirstBin = num-startBin
    #removes fractional (relative to bin width) part and divides
    #  startBin         <-binWidth-> <-----#
    #     |            |            |          |
    numBin = int((aboveFirstBin - (aboveFirstBin%binWidth))/binWidth)
    binArray[numBin][1] += 1

print(binArray)


fileRead.close()
fileWritten.close()