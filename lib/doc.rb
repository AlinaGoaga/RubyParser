class Doc
  attr_reader :list

  def initialize
    @list = {}
  end

  def parse(document)
    File.readlines(document).each do |line|
      key, value = line.split(' ')
      @list[key] = [] if @list[key].nil?
      @list[key] << value
    end
  end

end
