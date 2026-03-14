#This code duplicates a csv file but applies the function areaFromPixels() to each element in the csv file
import csv


frequencies = ["10mHz", "1Hz", "100Hz", "10kHz", "1MHz"]

#Read files into arrays (freqHashmap = {"10MHZ": [34, 37, 38, 40], ...})
freqHashmap = {}

for frequency in frequencies:
    #Setup CSV reader
    fileRead = open(f"../data/{frequency}-g-area.csv", newline = "")
    reader = csv.reader(fileRead)

    #add each row and then add array to hashmap ([t0, t1, t2, t3])
    tempArray = []
    for row in reader:
        tempArray.append(round(sum(map(float, row))/6, 1))
    start = tempArray[0]
    freqHashmap[frequency] = list(map(lambda x: round(x-start, 1), tempArray))
    fileRead.close()

#write into file (each column is a frequency)

csvData = []
for i in range(4):
    csvData.append([freqHashmap["10mHz"][i], freqHashmap["1Hz"][i], freqHashmap["100Hz"][i], freqHashmap["10kHz"][i], freqHashmap["1MHz"][i]])
print(csvData)

fileWritten = open(f"../data/line-graph-data-offset.csv", mode="w", newline = "")
writer = csv.writer(fileWritten)
for i in range(4):
    writer.writerow(csvData[i])
fileWritten.close()