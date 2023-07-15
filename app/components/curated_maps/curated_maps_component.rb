# frozen_string_literal: true

module CuratedMaps
  class CuratedMapsComponent < ViewComponent::Base
    def initialize(maps: )
      super
      @maps = maps
    end
  end
end
