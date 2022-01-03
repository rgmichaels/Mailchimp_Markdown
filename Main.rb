#!/usr/bin/env ruby\
require  "rubygems"
require "uri"
require "date"



#Write a time stamp to output file
File.write("markdownoutput.txt", Time.now, mode:"a")

# Write start to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Started\n", mode:"a")
# Needs error checking to see if file can be opened

datafile = File.read("supportingfiles/markupexample2.txt")
# Needs error checking to see if file can be opened

line_num = 0
File.open("supportingfiles/markupexample2.txt").each do | line |
  #puts "#{line_num += 1} #{line}"
  #puts "#{line}"


#  Methods
# This parses the headings #, ##, etc
# Detect Headings
def multiheadings(line)
  if line[0,1] == "#"
    # creates a new var mynewline as the var that will hold the markdown
    # adds <h
    # splits the first word out
    # counts the length of that first word for use as the header number
    # converts to string
    # and builds the rest of the html string
    # <h + number of chars + >  + original string + </h + number of chars + >
    mynewline = "<h" + line.split.first.length.to_s + ">" + line.split(' ')[1..-1].join(' ') + "</h" + line.split.first.length.to_s + ">"
    puts mynewline
    File.write("markdownoutput.txt", mynewline, mode:"a")
    File.write("markdownoutput.txt", "\n", mode:"a")
    end
  end



#deal with anchor tags
def anchors(line)
  if line.include? "Link"
  linktext = line.split("[").last.split("]").first
  line = line.gsub!(linktext,"<a href=\"") + linktext + "</a>"
  newline = line.gsub!("]","")
  newline = newline.gsub!("(","")
  newline = newline.gsub!(")","\">")
  puts newline.gsub("\n","")[1..-1]
  File.write("markdownoutput.txt", newline, mode:"a")
  File.write("markdownoutput.txt", "\n", mode:"a")
                    end
end



# This is unformatted text to wrap in <p> tags
# See if string length is > 0 then build the new string wrapped in tags
# This should be the fallback code

def unformatted(line)
  if line[0,1] != "#" or unless line.include?("http") or unless line.include?("https")
                                                           #ftp?
                                                           end
  #if line.length > 0 and line[0,1] != "#"
    mynewline = "<p>" + line + "</p>"
    puts mynewline.gsub("\n","")
    File.write("markdownoutput.txt", mynewline, mode:"a")
    File.write("markdownoutput.txt", "\n", mode:"a")
    # had to use that gsub because a newline kept going in places!
    # What if just a space?  Or Null?
  end
  end
  end




  multiheadings line
  anchors line
  unformatted line

end

#Write completion to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Completed\n", mode:"a")


# Needs error checking on file operations
# Needs protection against output and log file sizes.  Suggest new files each day with date stamp
#


