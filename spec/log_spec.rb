require 'log'

describe Log do

  let(:file_double) { double(:file) }
  let(:parser_double) { double(:parser) }
  let(:parser_class_double) { double(:parser_class, new: parser_double) }
  subject(:log) { Log.new(file_double, parser_class_double) }

  describe '#initialize' do
    it 'starts with an empty hash' do
      expect(log.list).to eq({})
    end
  end

  describe '#add_webpages' do
    it 'adds the webpages and the visitors to the list' do
      allow(parser_double).to receive(:parse).and_return(
        '/help_page/1' => ['126.318.035.038'])
      log.add_webpages
      expect(log.list).to eq({ '/help_page/1' => ['126.318.035.038'] })
    end
  end

  describe '#display_visits' do

    context 'for a webpage that has one visitor' do
      it 'displays the number of visits' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038'])
        log.add_webpages
        expect(log.display_visits).to eq(["/help_page/1: 1 view"])
      end
    end

    context 'for a webpage that has two visits from the same IP' do
      it 'displays the webpage with two views' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038', '126.318.035.038'])
        log.add_webpages
        expect(log.display_visits).to eq(["/help_page/1: 2 views"])
      end
    end

    context 'for multiple webpages that have multiple visitors (unique or not)' do
      it 'displays the number of visits in descending order' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038', '722.247.931.582'],
          '/contact' => ['184.123.665.067', '184.123.665.067'],
          '/about' => ['061.945.150.735'],
          '/about/2' => ['382.335.626.855', '802.683.925.780', '200.017.277.774'])
        log.add_webpages
        expect(log.display_visits).to eq(["/about/2: 3 views", "/help_page/1: 2 views", "/contact: 2 views", "/about: 1 view"])
      end
    end
  end

  describe '#display_unique_visits' do

    context 'for a webpage that has one visitor' do
      it 'displays the number of unique visits' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038'])
        log.add_webpages
        expect(log.display_unique_visits).to eq(["/help_page/1: 1 unique view"])
      end
    end

    context 'for a webpage that has two visits from the same IP' do
      it 'displays the webpage with one unique view' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038', '126.318.035.038'])
        log.add_webpages
        expect(log.display_unique_visits).to eq(["/help_page/1: 1 unique view"])
      end
    end

    context 'for multiple webpages that have multiple visitors (unique or not)' do
      it 'displays the number of unique visits in descending order' do
        allow(parser_double).to receive(:parse).and_return(
          '/help_page/1' => ['126.318.035.038', '722.247.931.582', '126.318.035.038', '126.318.035.038'],
          '/contact' => ['184.123.665.067', '184.123.665.067', '184.123.665.067'],
          '/about' => ['061.945.150.735', '802.683.925.780'],
          '/about/2' => ['382.335.626.855', '802.683.925.780', '200.017.277.774'])
        log.add_webpages
        expect(log.display_unique_visits).to eq(["/about/2: 3 unique views", "/help_page/1: 2 unique views", "/about: 2 unique views", "/contact: 1 unique view"])
      end
    end
  end

end
