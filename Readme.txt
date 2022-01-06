Hello there and happy new year!

I'd probably use the redcarpet gem for a real solution to this, it handles markdown -> html.
There are edge cases that would need to be handled, especially in the anchor tags.

This was made with Ruby 2.7 (x64) but it's pretty basic and should run on all versions.

It takes an input file (SupportingFiles/markdownexample.txt)
and outputs to screen and Output/markdownoutput.txt.

A basic error log is written to Logs/MailchimpMarkdown.log.

Ruby Installation / execution instructions:

Download and install Ruby 2.7.x for Windows.  This is the language
interpreter for Ruby applications.  A reboot may be required if Ruby isn't found.

    https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.5-1/rubyinstaller-devkit-2.7.5-1-x64.exe

Download and unzip the application to the folder of your choosing.
Using command prompt, navigate to the main folder of the files.
In my case, it is C:\Users\Rob\RubymineProjects\Mailchimp_Markdown

Within that folder you should see a file named Main.rb.

If Ruby is installed correctly, you should simply be able to type
at the command prompt:

    Main.rb

The screen should output the html converted markdown.  Other files
should be written as well:

    /Logs/MailchimpMarkdown.log
    /Output/markdownoutput.txt

If you wish to change the input file, you can modify:

    SupportingFiles/markupexample.txt






# Needs error checking on file operations
# Needs more error checking overall
# Needs protection against output and log file sizes.  Suggest new files each day with date stamp.
# For a test I would create a consistent sample input file and simply check (assert) the contents of that file
# Additional tests:
#   Large file handling, find breakpoint.
#   Large file handling, memory usage.
#   If a break point is found, calculate # of lines or size and log the error.
#   Make sure files are closed properly.

