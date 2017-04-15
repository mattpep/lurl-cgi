#!/usr/bin/ruby
require 'cgi'
cgi = CGI.new
h = cgi.params
urls = Hash[* IO.readlines(ENV['URL_FILE'])
              .map { |s| s.chomp.split('|') }
              .flatten]
if urls.keys.include? h['target'].first
  puts 'Status: 302 Found'
  puts "Location: #{ urls[h['target'].first] }"
  puts
else
  print "Content-type: text/html\n\n"
  print "<html><body>Not found</body></html>\n"
end
