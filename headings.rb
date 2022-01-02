

#markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
#                                  :autolink => true, :space_after_headers => true)

#mymrk = markdown.render("This is *bongos*, indeed.")
#puts mymrk


# Open text file to input data
#datafile = File.read("markupexample2.txt")

# Store text file data into a var and convert to markdown
#mymrk = markdown.render(datafile)

# We can do this line by line if needed using File.foreach("users.txt") { |line| puts line }
#puts mymrk

# Writes the data to a text file
#File.write("markdownoutput.txt", mymrk)

puts "------------------------------------------"
#File.write("markdownoutput.txt","------------------------------------------")
#File.foreach("markupexample2.txt") { |line| puts line }
#
#
=begin  THIS IS THE HEADER SECTION
puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
myline = "# Header one"
firstword = myline.split.first
#puts firstword

if myline.split.first == "#" then
  mynewline = "<h1>" + myline.split(' ')[1..-1].join(' ') + "</h1>"
end
if myline.split.first == "##" then
  mynewline = "<h2>" + myline.split(' ')[1..-1].join(' ') + "</h2>"
end

puts mynewline
=end

puts "***********************************************"
puts "Let's play with string lengths now"
myline = "#### Header one"
myfirstword = myline.split.first
puts myfirstword.length
puts myline[0,1]

puts "***********************************************"

# Is this a header tag?
myline = "####### Header one"

# If this is a header tag, reformat line into header markdown

end



#deal with anchor tags
myline = "[roblink](https://www.example.com)"

#if myline.include? "Link text"''
if myline.include? "[" and myline.include? "]"
  puts "Link text detected"

  linktext = myline.split("[").last.split("]").first
  puts linktext
  myline = myline.gsub!(linktext,"<a href=\"") + linktext + "</a>"
  myline = myline.gsub!("]","")
  myline = myline.gsub!("(","")
  myline = myline.gsub!(")","\">")
  #myline = myline.slice!(0)

  puts myline
  puts myline[1..-1]
end

puts "------------------------------------------------------------"
puts "------------------------------------------------------------"
myline = "[roblink](https://www.example.com)"

puts "------------------------------------------------------------"
puts "------------------------------------------------------------"




mynewline = "<a href=\"" +  URI.extract(myline).to_s + ">" + "linktext" + "</a>"
mynewline = myline.gsub!("]","")
mynewline = myline.gsub!(")","")
puts mynewline





=begin
Old heading block_given?def headings
  puts "THIS IS THE HEADING BLOCK"
  myline = "# Header one"

  if myline.split.first == "#" then
    mynewline = "<h1>" + myline.split(' ')[1..-1].join(' ') + "</h1>"
  end
  if myline.split.first == "##" then
    mynewline = "<h1>" + myline.split(' ')[1..-1].join(' ') + "</h2>"
  end
  puts myline
end
=end


