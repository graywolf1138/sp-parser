RSpec.describe ValidatorService do
  describe '.call' do
    subject(:validate) { described_class.valid?(file_path) }

    let(:file_path) { File.join('spec', 'fixtures', 'sample.log') }

    it { is_expected.to eq true }

    context 'without specified file' do
      let(:file_path) { nil }

      it { expect { validate }.to raise_error(described_class::NoFile, 'Please, specify path to file as argument') }
    end

    context 'when not existing input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'not_existing.log') }

      it { expect { validate }.to raise_error(described_class::FileNotFoundError, 'File not found') }
    end

    context 'without supported file extension' do
      let(:file_path) { File.join('spec', 'fixtures', 'sample_output.yml') }

      it { expect { validate }.to raise_error(described_class::FileExtensionError, 'File extension not supported') }
    end

    context 'when empty input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'empty.log') }

      it { expect { validate }.to raise_error(described_class::FileEmptyError, 'File is empty') }
    end
  end
end
