import skimage as ski
import numpy as np
import csv

# Filename format: {freq}{trial}_{time}
times = ["0", "1", "2", "3"]
trials = ["A", "B", "C", "D", "E", "F"]
variations = ["1", "2", "3", "4", "5"]

file = open("../data/red-areas.csv", mode= "w", newline = "")
writer = csv.writer(file)

for variation in variations:
    for time in times:
        for trial in trials:
            img = ski.io.imread(f'../Duckweed-photos/Red/{variation}{trial}_{time}.jpg', as_gray=True)
            zeroes = img.size - np.count_nonzero(img)
            writer.writerow([zeroes])
file.close()