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

leftSize = '2560x1440'

rightSize = '1920x1080'

Down.download(url, destination: "./current.jpg")

raw = ImageList.new("current.jpg")

def cropAndResize(input, gravity, outputSize)

  result = input.crop(gravity,input.rows/2, input.columns/2)
  
  x,y = outputSize.split('x').map(&:to_i)
  #puts x
  #puts y

  maxDim = [x,y].max

  #puts maxDim

  result.resize!(maxDim, maxDim)
  result.write(".temp.jpg")

  final = ImageList.new(".temp.jpg")

  final.crop!(0,0, x, y)

  #final.display

  return final

end

cropAndResize(raw, NorthEastGravity, rightSize).write("right.jpg")
cropAndResize(raw, NorthWestGravity, leftSize).write("left.jpg")
