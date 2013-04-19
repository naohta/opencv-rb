require 'opencv'

image = OpenCV::IplImage.load("image.jpg")
template = OpenCV::IplImage.load("template.jpg")
result = image.match_template(template)

min_score,max_score,min_point,max_point = result.min_max_loc

from = min_point
to = OpenCV::CvPoint.new(from.x+template.width, from.y+template.height)
image.rectangle!(from,to,:color => OpenCV::CvColor::Red, :thickness =>1)

#window = OpenCV::GUI::Window.new("canvas")
image.save_image("output.png")

