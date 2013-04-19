require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} ImageFile"
  exit
end

image = nil
begin
  # �摜�����[�h
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

# �O���[�X�P�[���ɂ��đ�Â̓�l��
mat, th = mat0.BGR2GRAY.threshold(0, 255, CV_THRESH_BINARY | CV_THRESH_OTSU)
show mat

# Canny�̃G�b�W���o
mat = mat.canny(50, 200)
show mat

# �m���I�n�t�ϊ��Œ������o
seq = mat.hough_lines(CV_HOUGH_PROBABILISTIC, 1, Math::PI / 180, 50, 50, 10)

# ���o����������`��
result = mat.GRAY2BGR
seq.each { |points|
  result.line!(*points, :color => CvColor::Red, :thickness => 2, :line_type => :aa)
}
show result

