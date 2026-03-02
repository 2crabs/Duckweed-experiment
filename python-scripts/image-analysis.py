import skimage as ski
import numpy as np
import csv

# Filename format: {freq}{trial}_{time}
times = ["0", "1", "2", "3"]
trials = ["A", "B", "C", "D", "E", "F"]
variations = ["1", "2", "3", "4", "5"]

results = []

file = open("../data/1MHz-r.csv", mode= "w", newline = "")
writer = csv.writer(file)

for time in times:
    for trial in trials:
        img = ski.io.imread(f'../Duckweed-photos/Red/5{trial}_{time}.jpg', as_gray=True)
        zeroes = img.size - np.count_nonzero(img)
        results.append(zeroes)
    writer.writerow(results)
    results = []
file.close()