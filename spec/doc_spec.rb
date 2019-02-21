require 'doc'

describe Doc do
  subject(:doc) { Doc.new }

  describe '#initialize' do
    it 'starts with an empty hash' do
      expect(doc.list).to eq({})
    end
  end

  describe '#parse' do
    it 'parses the doc' do
      doc.parse('./test.log')
      expect(doc.list).to eq('/help_page/1' => ['126.318.035.038', '722.247.931.582'],
                             '/contact' => ['184.123.665.067'], '/about' => ['061.945.150.735'],
                             '/about/2' => ['382.335.626.855', '802.683.925.780', '200.017.277.774'])
    end
  end

  describe '#count_visits' do
    it 'counts the number of visits' do
      doc.parse('./test.log')
      expect(doc.count_visits).to eq('/help_page/1' => 2, '/contact' => 1, '/about' => 1, '/about/2' => 3)
    end
  end

  describe '#display_visits' do
    it 'displays the number of visits in descending order' do
      doc.parse('./test.log')
      expect(doc.display_visits).to eq('/about/2' => 3, '/help_page/1' => 2, '/contact' => 1, '/about' => 1)
    end
  end
end
