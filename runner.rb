require './lib/log'
require './lib/parser'

log = Log.new(ARGV[0])
log.add_webpages

puts "\n***Visits to webpage***"
puts log.display_visits

puts "\n***Unique visits to webpage***"
puts log.display_unique_visits
