require './lib/log'
require './lib/parser'
require './lib/display'

log = Log.new(ARGV[0])

puts "\n***Visits to webpage***"
display = Display.new(log.add_webpages)
puts display.display_visits

puts "\n***Unique visits to webpage***"
puts display.display_unique_visits
