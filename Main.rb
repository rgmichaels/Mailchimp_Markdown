#!/usr/bin/env ruby\
require "rubygems"
require "uri"
require "date"

#Methods are above and I call the methods at the end of the file


# Needs error checking on file operations
# Needs more error checking overall
# Needs protection against output and log file sizes.  Suggest new files each day with date stamp
# For a test I would create a consistent sample input file and simply check (assert) the contents of that file
# Ideally I'd likely use the redcarpet gem which handles the real solution
# Additional tests:
#   Large file handling, find breakpoint.
#   Large file handling, memory usage.
#   If a breakpoint is found, calculate # of lines or size and log the error.
#   Make sure files are closed properly.

#Write a time stamp to output file
File.write("Output/markdownoutput.txt", Time.now, mode:"a")

# Write time and start to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Started\n", mode:"a")

# Open input data file for use and execute code for each line
File.open("supportingfiles/markupexample.txt").each do | line |

# This parses the headings #, ##, etc
def multiheadings(line)
  if line[0,1] == "#"
    mynewline = "<h" + line.split.first.length.to_s + ">" + line.split(' ')[1..-1].join(' ') + "</h" + line.split.first.length.to_s + ">"
    puts mynewline
    File.write("Output/markdownoutput.txt", mynewline + "\n", mode:"a")
    end
  end

#build anchor tags
  # inline anchors need to be handled, might need some regex work or an acceptable gem/library
  # multiple anchors may not be handled
def anchors(line)
  if line.include? "http" #Link
  linktext = line.split("[").last.split("]").first
  line = line.gsub!(linktext,"<a href=\"") + linktext + "</a>"
  line = line.gsub!("\n","") # a new line kept appearing after the link text!
  newline = line.gsub!("]","")
  newline = newline.gsub!("(","")
  newline = newline.gsub!(")","\">")
  puts newline.gsub("\n","")[1..-1]
  File.write("Output/markdownoutput.txt", newline.gsub("\n","")[1..-1] + "\n", mode:"a")
                    end
end

# Handles unformatted text lines (p tags)
# Refactoring could do some justice in the ifs.
def unformatted(line)
  if line[0,1] != "#" and line[0,1] != "["

  if line[0,1] != "#" or unless line.include?("http") or unless line.include?("https")
                                                           #other link types need to be handled like ftp
                                                         end
                         end
    mynewline = "<p>" + line + "</p>"
    puts mynewline.gsub("\n","")
    File.write("Output/markdownoutput.txt", mynewline + "\n", mode:"a")
    # had some inconsistencies between screen output and file output thus the \n work
    # Spaces, nulls need to be handled
  end
  end

end

# this should be faster if IFs were moved here instead of running unnecessary code
  multiheadings line
  anchors line
  unformatted line

end # ends the initial for loop for file opening

#Write completion to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Completed\n", mode:"a")





