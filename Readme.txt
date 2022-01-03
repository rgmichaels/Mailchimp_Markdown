Hello there and happy new year!

I'd probably use the redcarpet gem for a real solution to this, it handles markdown -> html.
There are edge cases that would need to be handled, especially in the anchor tags.

This was made with Ruby 2.7 (x64) but it's pretty basic and should run on all versions.

It should be able to run via command prompt, however I have been running through Rubymine.
The file to execute is Main.rb.

It takes an input file (SupportingFiles/markdownexample.txt)
and outputs to screen and Output/markdownoutput.txt.

A basic error log is written to Logs/MailchimpMarkdown.log.

# Needs error checking on file operations
# Needs more error checking overall
# Needs protection against output and log file sizes.  Suggest new files each day with date stamp.
# For a test I would create a consistent sample input file and simply check (assert) the contents of that file
# Ideally I'd likely use the redcarpet gem which handles the real solution
# Additional tests:
#   Large file handling, find breakpoint.
#   Large file handling, memory usage.
#   If a break point is found, calculate # of lines or size and log the error.
#   Make sure files are closed properly.

