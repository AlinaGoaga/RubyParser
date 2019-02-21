require 'doc'

describe Doc do

  describe '#initialize' do
    it 'starts with an empty hash' do
      doc = Doc.new
      expect(doc.list).to eq({})
    end
  end
end
