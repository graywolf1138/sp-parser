RSpec.describe Parser do
  describe '#perform' do
    subject(:parser) { described_class.new(file_path: path).perform }

    let(:path) { File.join('spec', 'fixtures', 'sample.log') }

    it 'returns visits array' do
      expect(parser).to be_an Array
    end
  end
end
