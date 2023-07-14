# frozen_string_literal: true

module CuratedMaps
  class CuratedMapComponent < ViewComponent::Base
    def initialize(map:)
      super
      @map = map
    end
  end
end
