RSpec.describe MostVisitsCounter do
  describe '#call' do
    subject(:counter) { described_class.new(visits).call }

    let(:visit1) { instance_double('visit1', uri: '/index', ip: '0.0.0.0') }
    let(:visit2) { instance_double('visit2', uri: '/sample/uri', ip: '0.0.0.0') }
    let(:visit3) { instance_double('visit3', uri: '/sample/uri', ip: '1.1.1.1') }
    let(:visits) { [visit1, visit2, visit3] }
    let(:counted_visits) do
      { '/sample/uri' => 2, '/index' => 1 }
    end

    it 'counts visits entries' do
      expect(counter).to eq counted_visits
    end

    it 'returns sorted entries' do
      expect(counter['/sample/uri'] > counter['/index']).to be_truthy
    end
  end
end
