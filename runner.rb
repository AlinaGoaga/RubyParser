require './lib/log'
require './lib/parser'

log = Log.new(ARGV[0])
log.add_webpages
puts log.display_visits
puts log.display_unique_visits
