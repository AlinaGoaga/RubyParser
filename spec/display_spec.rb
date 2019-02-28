require 'display'

describe Display do

  describe '#display_visits' do
    it 'displays the number of visits' do
      display = Display.new('/help_page/1' => ['126.318.035.038'])
      expect(display.display_visits).to eq(["/help_page/1: 1 view"])
    end
  end

  describe '#display unique visits' do
    it 'displays the webpage with one unique view' do
      display = Display.new('/help_page/1' => ['126.318.035.038', '126.318.035.038'])
      expect(display.display_unique_visits).to eq(["/help_page/1: 1 unique view"])
    end
  end
end
