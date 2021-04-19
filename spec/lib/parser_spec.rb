RSpec.describe Parser do
  describe '#perform' do
    subject(:parser) { described_class.new(file_path: path).perform }

    let(:path) { File.join('spec', 'fixtures', 'sample.log') }

    it 'stdouts to output' do
      expect { parser }.to output.to_stdout
    end
  end
end
