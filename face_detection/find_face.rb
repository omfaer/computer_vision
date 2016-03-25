#!/usr/bin/env ruby
require "opencv"
abort "Usage: #{$0} source_image_file  dest_image_file" unless ARGV.length == 2
classifiers_dir = "/home/omfaer/opencv-2.4.10/data/haarcascades"
data = File.join(classifiers_dir, "haarcascade_frontalface_alt.xml")
detector = OpenCV::CvHaarClassifierCascade::load(data)
image = OpenCV::IplImage.load(ARGV[0])
detector.detect_objects(image).each do |region|
  color = OpenCV::CvColor::Red
  image.rectangle! region.top_left, region.bottom_right, :color => color
end
image.save_image(ARGV[1])
