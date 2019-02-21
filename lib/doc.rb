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

  def count_visits
    @list.map { |key, value| [key, value.count] }.to_h
  end

end
