# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CuratedMaps::CuratedMapsComponent, type: :component do
  let(:maps) { ::NyuGeoblacklight::CuratedCollections.maps.sample(3) }

  it 'renders the maps' do
    render_inline(described_class.new(maps: maps))

    expect(page).to have_css('div.curated-maps')
  end

  it 'renders the maps title' do
    render_inline(described_class.new(maps: maps))

    expect(page).to have_css('h4')
    expect(page).to have_content('Featured Maps')
  end
end
