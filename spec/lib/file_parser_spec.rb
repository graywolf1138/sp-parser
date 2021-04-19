RSpec.describe FileParser do
  describe '#call' do
    subject(:file_parser) { described_class.new(path).call }

    let(:path) { File.join('spec', 'fixtures', 'sample.log') }

    it { expect(file_parser).to all(be_a Line) }
    it { expect(file_parser.count).to eq 3 }
  end
end
