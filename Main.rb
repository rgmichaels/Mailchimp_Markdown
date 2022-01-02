#!/usr/bin/env ruby\
require  'rubygems'
require "uri"
#gem 'redcarpet'
#require 'redcarpet'
#require 'redcarpet/render_strip'


#  Methods
# This parses the headings #, ##, etc
# Detect Headings

myline = "###### This is my heading"

def multiheadings(myline)
  #myline = "###### This is my heading"
  if myline[0,1] == "#"
    # creates a new var mynewline as the var that will hold the markdown
    # adds <h
    # splits the first word out
    # counts the length of that first word for use as the header number
    # converts to string
    # and builds the rest of the html string
    # <h + number of chars + >  + original string + </h + number of chars + >
    mynewline = "<h" + myline.split.first.length.to_s + ">" + myline.split(' ')[1..-1].join(' ') + "</h" + myline.split.first.length.to_s + ">"
    puts mynewline
    end
end

# This is unformatted text to wrap in <p> tags
# See if string lenth is > 0 then build the new string wrapped in tags
# This should be the fallback code
def unformatted(myline)
  if myline.length > 0
    mynewline = "<p>" + myline + "</p>"
    puts mynewline
    # What if just a space?  Or Null?
  end
end



puts "Multiheadings:"
  multiheadings "### Header 3"

puts "Unformatted:"
puts unformatted "This is my unformatted line"

# #
# ##
# ######
# Unformatted?
# [Link Text]
#
