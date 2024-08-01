# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Catalog::DownloadsCollapseComponent, type: :component do
  let(:document) { instance_double(SolrDocument, id: 123) }

  before do
    allow(document).to receive_messages(
      multi_direct_downloads: [],
      file_format: 'Shapefile',
      direct_download: { download: 'https://example.com/download' },
      restricted?: restricted,
      hgl_download: false,
      iiif_download: false,
      download_types: []
    )
  end

  context 'when the download is restricted' do
    let(:restricted) { true }

    it 'renders restricted links with a target of _blank' do
      render_inline(described_class.new(document:))

      expect(page).to have_link('Original Shapefile', href: 'https://example.com/download', target: '_blank')
    end
  end

  context 'when the download is not restricted' do
    let(:restricted) { false }

    it 'renders the download link with no target' do
      render_inline(described_class.new(document:))

      expect(page).to have_link('Original Shapefile', href: 'https://example.com/download', target: nil)
    end
  end
end
