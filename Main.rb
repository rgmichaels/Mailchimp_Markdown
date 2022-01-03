
#!/usr/bin/env ruby\
require "rubygems"
require "uri"
require "date"

#Methods are above and I call the methods at the end of the file

#Write a time stamp to output file
File.write("Output/markdownoutput.txt", Time.now, mode:"a")

# Write time and start to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Started\n", mode:"a")

# Open input data file for use and execute code for each line
File.open("supportingfiles/markupexample.txt").each do | line |


  # This parses the headings #, ##, etc
  def multiheadings(line)
      mynewline = "<h" + line.split.first.length.to_s + ">" + line.split(' ')[1..-1].join(' ') + "</h" + line.split.first.length.to_s + ">"
      puts mynewline
      File.write("Output/markdownoutput.txt", mynewline + "\n", mode:"a")
  end

  #build anchor tags
  #This requires testing
  def anchors (line)
      linktext = line.split("[").last.split("]").first
      linkurl = line.split("(").last.split(")").first
      markdownlink = "<a href=\"" + linkurl + ">" + linktext + "</a>"
      puts markdownlink
      File.write("Output/markdownoutput.txt", markdownlink + "\n", mode:"a")
  end

  # Handles unformatted text lines (p tags).
  def unformatted(line)
        unformattedline = "<p>" + line + "</p>"
        puts unformattedline.gsub("\n","")
        File.write("Output/markdownoutput.txt", unformattedline + "\n", mode:"a")
        # Spaces, nulls need to be tested/handled
  end

  # This executes the methods
  if line[0,1] == "#"
    multiheadings line
  end
  if line.include?("http")
    anchors line
  end
  if line[0,1] != "#" and line[0,1] != "["
    unformatted line
  end
end # ends the initial for loop for file opening

#Write completion to log
File.write("Logs/MailchimpMarkdown.log", Time.now.to_s + " Mailchimp Markdown Completed\n", mode:"a")





