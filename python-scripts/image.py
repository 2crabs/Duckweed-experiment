import skimage as ski
import numpy as np
import matplotlib.pyplot as plt
import time
import os

#returns gray rgb image with red pixels white
def isolate_red(hsv_image):
    # -> (row,column)
    h = hsv_image[:, :, 0]
    s = hsv_image[:, :, 1]

    # create array with boolean values
    mask = ((h < 0.06) | (h > 0.94)) & (s > 0.5)

    # create 2d array with
    bw = np.zeros_like(h, dtype=np.uint8)

    # index with boolean array and set true values to white
    bw[mask] = 255
    return ski.color.gray2rgb(bw)

#returns gray rgb image with red pixels white
def isolate_green(hsv_image):
    # -> (row,column)
    h = hsv_image[:, :, 0]
    s = hsv_image[:, :, 1]

    # create array with boolean values
    mask = (h > 0.16) & (h < 0.5) & (s > 0.3)

    # create 2d array with
    bw = np.zeros_like(h, dtype=np.uint8)

    # index with boolean array and set true values to white
    bw[mask] = 255
    return ski.color.gray2rgb(bw)

start = time.time()

img = ski.io.imread('../imgs/test-2.jpg')

# (row, column, channel), 0.0 to 1.0
img_hsv = ski.color.rgb2hsv(img)

ski.io.imsave('red.jpg', isolate_red(img_hsv))
ski.io.imsave('green.jpg', isolate_green(img_hsv))

stop = time.time()
print(stop - start)
