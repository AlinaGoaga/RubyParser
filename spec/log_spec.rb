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

end
