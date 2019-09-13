#!/usr/bin/ruby
require "bundler/setup"
require "down"
require "rmagick"


time = Time.now

url = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/"\
      "#{time.year}#{time.yday}#{time.hour}#{time.min.floor(-1)}"\
      "_GOES16-ABI-FD-GEOCOLOR-5424x5424.jpg"

puts url

Down.download(url, destination: "./")


