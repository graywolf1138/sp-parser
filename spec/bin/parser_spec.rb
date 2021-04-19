require 'open3'
require 'yaml'

RSpec.describe 'parser' do
  describe 'script' do
    let(:stdoutput) { Open3.capture3("./bin/parser #{file_path}") }
    let(:file_path) { File.join('spec', 'fixtures', 'sample.log') }
    let(:result) { stdoutput[0] }
    let(:errors) { stdoutput[1] }
    let(:expected_result) { YAML.load_file('spec/fixtures/sample_output.yml') }

    it { expect(result).to eq expected_result }

    context 'when file path not provided' do
      let(:file_path) { nil }

      it { expect(errors).to eq "Please, specify path to file as argument\n" }
    end

    context 'when not existing input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'not_existing.log') }

      it { expect(errors).to eq "File not found\n" }
    end

    context 'when not supported input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'sample_output.yml') }

      it { expect(errors).to eq "File extension not supported\n" }
    end

    context 'when empty input file' do
      let(:file_path) { File.join('spec', 'fixtures', 'empty.log') }

      it { expect(errors).to eq "File is empty\n" }
    end
  end
end
