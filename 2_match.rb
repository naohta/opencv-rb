require 'opencv'

image = OpenCV::IplImage.load("image.jpg")
tpl = OpenCV::IplImage.load("template.jpg")
result = image.match_template(tpl)
p result

