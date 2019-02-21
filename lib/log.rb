class Log
  attr_reader :list

  def initialize(document, parser_class = Parser)
    @parser_class = parser_class
    @document = document
    @list = {}
  end

  def add_webpages
    parser = @parser_class.new
    @list = parser.parse(@document)
  end

  def count_visits
    @list.map { |key, value| [key, value.count] }.to_h
  end

  def display_visits
    sorted = count_visits.sort_by { |_key, value| value }.reverse
    sorted.map { |key, value| "#{key}: #{value} views" }
  end

  def count_unique_visits
    @list.map { |key, value| [key, value.uniq.count] }.to_h
  end

  def display_unique_visits
    sorted = count_unique_visits.sort_by { |_key, value| value }.reverse
    sorted.map { |key, value| "#{key}: #{value} unique views" }
  end

end
