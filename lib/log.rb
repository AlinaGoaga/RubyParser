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
    Hash[count_visits.sort_by { |_key, value| value }.reverse]
  end
end
