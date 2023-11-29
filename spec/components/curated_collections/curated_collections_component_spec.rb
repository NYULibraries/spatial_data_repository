# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CuratedCollections::CuratedCollectionsComponent, type: :component do
  let(:view) do
    render_inline(described_class.new(collections:,
                                      header:))
  end

  let(:collections) { NyuGeoblacklight::CuratedCollections.collections.take(3) }
  let(:header) { 'Curated Collections' }

  it 'renders the header' do
    expect(view.css('h3').text).to eq(header)
  end

  it 'renders the collections' do
    expect(view.css('.card-collection').count).to eq(3)
  end
end
