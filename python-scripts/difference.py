import skimage as ski
import numpy as np
import csv

# Filename format: {freq}{trial}_{time}
times = ["0", "1", "2", "3"]
trials = ["A", "B", "C", "D", "E", "F"]
variations = ["1", "2", "3", "4", "5"]

results = []

file = open("../data/difference.csv", mode= "w", newline = "")
writer = csv.writer(file)

for trial in trials:
    for variation in variations:
        img = ski.io.imread(f'../Duckweed-photos/Green/{variation}{trial}_{0}.jpg', as_gray=True)
        zeroes1 = img.size - np.count_nonzero(img)
        img = ski.io.imread(f'../Duckweed-photos/Green/{variation}{trial}_{3}.jpg', as_gray=True)
        zeroes2 = img.size - np.count_nonzero(img)
        results.append(zeroes2-zeroes1)
        print(variation)
    writer.writerow(results)
    results = []
file.close()