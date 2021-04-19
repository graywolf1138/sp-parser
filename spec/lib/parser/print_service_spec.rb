RSpec.describe PrintService do
  let(:counted_visits) do
    {
      '/contacts' => 2,
      '/index' => 1
    }
  end

  describe '#visits' do
    subject(:printer) { described_class.new.visits(counted_visits) }

    let(:expected_output) { "List of webpages with most visits:\n/contacts 2\n/index 1\n\n" }

    it 'stdouts expected output' do
      expect { printer }.to output(expected_output).to_stdout
    end
  end

  describe '#uniq_visits' do
    subject(:printer) { described_class.new.uniq_visits(counted_visits) }

    let(:expected_output) { "List of webpages with most unique visits:\n/contacts 2\n/index 1\n\n" }

    it 'stdouts expected output' do
      expect { printer }.to output(expected_output).to_stdout
    end
  end
end
