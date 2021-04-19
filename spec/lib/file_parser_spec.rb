RSpec.describe FileParser do
  describe '#call' do
    subject(:file_parser) { described_class.new(path).call }

    let(:path) { File.join('spec', 'fixtures', 'sample.log') }
    let(:expected_output) do
      [
        ['/sample/uri', '127.0.0.1'],
        ['/sample/uri', '127.0.0.1'],
        ['/index', '192.168.0.1']
      ]
    end

    it { expect(file_parser).to eq expected_output }
    it { expect(file_parser.count).to eq 3 }
  end
end
