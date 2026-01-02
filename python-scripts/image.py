import skimage as ski
import numpy as np
import matplotlib.pyplot as plt
import time

start = time.time()

img = ski.data.astronaut()
img_hsv = ski.color.rgb2hsv(img)

for y in range(img_hsv.shape[0]):
    for x in range(img_hsv.shape[1]):
        h = img_hsv[y, x][0] * 255
        s = img_hsv[y, x][1] * 255
        if 60 > h > 5 and s > 128:
            img[y, x] = [255, 255,255]
        else:
            img[y, x] = [0,0,0]


ski.io.imsave('image.jpg', img)

stop = time.time()
print(stop - start)