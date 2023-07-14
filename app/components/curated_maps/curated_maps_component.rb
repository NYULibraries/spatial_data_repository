# frozen_string_literal: true

module CuratedMaps
  class CuratedMapsComponent < ViewComponent::Base
    def initialize(maps: ::NyuGeoblacklight::CuratedCollections.maps.sample(3))
      super
      @maps = maps
    end
  end
end
