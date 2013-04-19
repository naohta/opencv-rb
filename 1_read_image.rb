require 'opencv'

image = OpenCV::IplImage.load("image.jpg")
p image
