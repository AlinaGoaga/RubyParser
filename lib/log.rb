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

  def display_visits
    sort_visits.map { |key, value| "#{key}: #{value} views" }
  end

  def display_unique_visits
    sort_unique_visits.map { |key, value| "#{key}: #{value} unique views" }
  end

private

  def count_visits
    @list.map { |key, value| [key, value.count] }.to_h
  end

  def count_unique_visits
    @list.map { |key, value| [key, value.uniq.count] }.to_h
  end

  def sort_visits
    count_visits.sort_by { |_key, value| -value }
  end

  def sort_unique_visits
    count_unique_visits.sort_by { |_key, value| -value }
  end
end
