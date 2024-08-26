require 'spec_helper'

RSpec.describe NyuGeoblacklight::WmsLayer do
  context 'when the URL param contains the NYU proxy' do
    it 'strips out the NYU proxy' do
      wms_layer = described_class.new({ 'URL' => 'http://proxy.library.nyu.edu/login?url=http://example.com' })

      expect(wms_layer.url).to eq('http://example.com')
    end
  end
end
