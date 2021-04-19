require 'open3'
require 'yaml'

RSpec.describe 'parser' do
  describe 'script' do
    let(:stdoutput) { Open3.capture3("./bin/parser #{file_path}") }
    let(:file_path) { File.join('spec', 'fixtures', 'sample.log') }
    let(:result) { stdoutput[0] }
    let(:expected_result) { YAML.load_file('spec/fixtures/sample_output.yml') }

    it { expect(result).to eq expected_result }
  end
end
