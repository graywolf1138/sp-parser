RSpec.describe Line do
  let(:uri) { '/sample/uri' }
  let(:ip) { '127.0.0.1' }

  describe '.initialize' do
    subject { described_class.new(uri, ip) }

    it { is_expected.to have_attributes(uri: '/sample/uri', ip: '127.0.0.1') }
  end
end
