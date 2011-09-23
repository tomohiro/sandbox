#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_images
  Nokogiri::HTML(open(ARGV.first).read)/'img'
end

if ARGV[1] == '--html'
  puts '<html><body>'
  get_images.each do |i|
    puts "<img src=#{i.attributes['src']} height=20%>" if i.to_s =~ /upload/
  end
  puts '</body></html>'
else
  get_images.each do |i|
    puts i.attributes['src'] if i.to_s =~ /upload/
  end
end

