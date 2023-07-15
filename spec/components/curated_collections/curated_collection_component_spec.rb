# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CuratedCollections::CuratedCollectionComponent, type: :component do
  let(:collection) { NyuGeoblacklight::CuratedCollections.collections.first }
  let(:component) { described_class.new(collection: collection) }

  describe 'rendering the component' do
    subject { render_inline(component) }

    it { is_expected.to have_css('.card-title', text: collection[:title]) }
    it { is_expected.to have_css('.card-text', text: collection[:description]) }
  end
end
