#!/usr/bin/ruby
require 'cgi'
cgi = CGI.new
h = cgi.params
show_invalid_key = h['show_invalid_key']
urls = Hash[* IO.readlines(ENV['URL_FILE'])
              .map { |s| s.chomp.split('|') }
              .flatten]
if urls.keys.include? h['target'].first
  puts 'Status: 302 Found'
  puts "Location: #{ urls[h['target'].first] }"
  puts
elsif show_invalid_key.any?
  puts 'Status: 404 Not Found'
  print "Content-type: text/html\n\n"
  print "<html><body>URL key #{ h['target'].first } invalid </body></html>\n"
else
  print "Content-type: text/html\n\n"
  print "<html><body>Not found</body></html>\n"
end
