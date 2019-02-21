require 'log'

describe Log do
  let(:parser_double) { double(:parser) }
  let(:parser_class_double) { double(:parser_class) }
  subject(:log) { Log.new('./test.log', parser_class_double) }

  describe '#initialize' do
    it 'starts with an empty hash' do
      expect(log.list).to eq({})
    end
  end

  describe '#count_visits' do
    it 'counts the number of visits' do
      allow(parser_class_double).to receive(:new).and_return(parser_double)
      allow(parser_double).to receive(:parse).and_return('/help_page/1' => ['126.318.035.038', '722.247.931.582'],
        '/contact' => ['184.123.665.067'], '/about' => ['061.945.150.735'],
        '/about/2' => ['382.335.626.855', '802.683.925.780', '200.017.277.774'])
      log.add_webpages
      expect(log.count_visits).to eq('/help_page/1' => 2, '/contact' => 1, '/about' => 1, '/about/2' => 3)
    end
  end
    
  describe '#display_visits' do
    it 'displays the number of visits in descending order' do
      allow(parser_class_double).to receive(:new).and_return(parser_double)
      allow(parser_double).to receive(:parse).and_return('/help_page/1' => ['126.318.035.038', '722.247.931.582'],
        '/contact' => ['184.123.665.067'], '/about' => ['061.945.150.735'],
        '/about/2' => ['382.335.626.855', '802.683.925.780', '200.017.277.774'])
      log.add_webpages
      expect(log.display_visits).to eq('/about/2' => 3, '/help_page/1' => 2, '/contact' => 1, '/about' => 1)
    end
  end

end
