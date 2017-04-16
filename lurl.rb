#!/usr/bin/ruby
require 'cgi'
require 'redis'

cgi = CGI.new
redis = Redis.new

h = cgi.params
url = redis.get h['target'].first

show_invalid_key = h['show_invalid_key']
if url
  puts 'Status: 302 Found'
  puts "Location: #{ url }"
  puts
elsif show_invalid_key.any?
  puts 'Status: 404 Not Found'
  print "Content-type: text/html\n\n"
  print "<html><body>URL key #{ h['target'].first } invalid </body></html>\n"
else
  print "Content-type: text/html\n\n"
  print "<html><body>Not found</body></html>\n"
end
