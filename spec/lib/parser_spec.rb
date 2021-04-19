RSpec.describe Parser do
  describe '#perform' do
    subject(:parser) do
      described_class.new(
        parse_path: path,
        most_visits: most_visits,
        uniq_visits: uniq_visits,
        file_parser: file_parser,
        file_line: file_line,
        print_service: print_service
      ).perform
    end

    let(:path) { File.join('spec', 'fixtures', 'sample.log') }
    let(:most_visits) { instance_spy('most_visits') }
    let(:uniq_visits) { instance_spy('uniq_visits') }
    let(:file_parser) { instance_spy('file_parser') }
    let(:file_line) { class_spy('file_line') }
    let(:print_service) { instance_spy('print_service') }

    before do
      allow(print_service).to receive(:visits)
      allow(print_service).to receive(:uniq_visits)
    end

    it 'parses visits' do
      parser

      expect(print_service).to have_received(:visits)
    end

    it 'parses uniq visits' do
      parser

      expect(print_service).to have_received(:uniq_visits)
    end
  end
end
