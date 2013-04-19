require 'opencv'
include OpenCV

image = IplImage.load("image.jpg")

window = OpenCV::GUI::Window.new("Display window")
window.show(image)
GUI::wait_key

