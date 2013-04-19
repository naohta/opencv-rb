require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} ImageFile"
  exit
end

image = nil
begin
  # 画像をロード
  mat0 = CvMat.load(ARGV[0], CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH)
rescue
  puts 'Could not open (or find) the image.'
  exit
end

$window = OpenCV::GUI::Window.new "Display window"
def show(img)
  img.save_image("#{__FILE__}.output.png")
  $window.show(img)
  GUI::wait_key
end

show mat0

# グレースケールにして大津の二値化
mat, th = mat0.BGR2GRAY.threshold(0, 255, CV_THRESH_BINARY | CV_THRESH_OTSU)
show mat

# Cannyのエッジ検出
mat = mat.canny(50,50)
show mat


