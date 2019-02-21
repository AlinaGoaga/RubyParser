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
end 
