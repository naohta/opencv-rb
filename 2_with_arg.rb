require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} ImageFile"
  exit
end

image = nil
begin
  image = IplImage.load(ARGV[0])
rescue
  puts 'Could not open (or find) the image.'
  exit
end

image.save_image("#{__FILE__}.output.png")
window = OpenCV::GUI::Window.new("Display window")
window.show(image)
GUI::wait_key

