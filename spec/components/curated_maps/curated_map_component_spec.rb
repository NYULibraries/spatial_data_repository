# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CuratedMaps::CuratedMapComponent, type: :component do
  let(:map) { ::NyuGeoblacklight::CuratedCollections.maps.first }

  it 'renders the map' do
    render_inline(described_class.new(map:))

    expect(page).to have_css('a.curated-card')
  end

  it 'renders the map title' do
    render_inline(described_class.new(map:))

    expect(page).to have_css('h4.card-title')
    expect(page).to have_content(map[:title])
  end
end
