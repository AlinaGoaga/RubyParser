class Parser

  def parse(document)
    list = {}
    File.readlines(document).each do |line|
      key, value = line.split(' ')
      list[key] = [] if list[key].nil?
      list[key] << value
    end
    return list
  end

end
