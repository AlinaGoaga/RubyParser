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

end
