# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CuratedCollections::CuratedCollectionsComponent, type: :component do
  let(:collections) { NyuGeoblacklight::CuratedCollections.collections.take(3) }
  let(:header) { 'Curated Collections' }

  subject do
    render_inline(described_class.new(collections:,
                                      header:))
  end

  it 'renders the header' do
    expect(subject.css('h3').text).to eq(header)
  end

  it 'renders the collections' do
    expect(subject.css('.card-collection').count).to eq(3)
  end
end
