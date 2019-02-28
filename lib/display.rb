class Display

  def initialize(list)
    @list = list
  end

  def display_visits
    sort_visits("all").map { |key, value|
      value > 1 ? "#{key}: #{value} views" : "#{key}: #{value} view"
    }
  end

  def display_unique_visits
    sort_visits("unique").map { |key, value|
      value > 1 ? "#{key}: #{value} unique views" : "#{key}: #{value} unique view"
    }
  end

  private

  def count_visits
    @list.map { |key, value| [key, value.count] }.to_h
  end

  def count_unique_visits
    @list.map { |key, value| [key, value.uniq.count] }.to_h
  end

  def sort_visits(option)
    if option == "all"
      count_visits.sort_by { |_key, value| -value }
    elsif option == "unique"
      count_unique_visits.sort_by { |_key, value| -value }
    end
  end

end 
