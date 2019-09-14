#!/usr/bin/ruby
require "bundler/setup"
require "down"
require "rmagick"
include Magick

def downloadRawImage(time)
  # theres a bug here probably cause of UTC? idk dont need this anymore unless
  # i want to animate
  url = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/"\
        "#{time.year}#{time.yday}#{time.hour}#{time.min.floor(-1)}"\
        "_GOES16-ABI-FD-GEOCOLOR-5424x5424.jpg"

  puts url

  Down.download(url, destination: "./current.jpg")

end


url = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/5424x5424.jpg"

imageX = 5424
imageY = 5424

leftX = 2560
leftY = 1440

rightX = 1920
rightY = 1080

Down.download(url, destination: "./current.jpg")

raw = ImageList.new("current.jpg")

left=raw.crop(NorthWestGravity,imageX/2, imageY/2)
left.resize_to_fill!(leftX, leftY, NorthGravity)
left.display
left.write("left.jpg")

right=raw.crop(NorthEastGravity,imageX/2, imageY/2)
right.resize_to_fill!(leftX, leftY, NorthGravity)
right.display
right.write("right.jpg")
