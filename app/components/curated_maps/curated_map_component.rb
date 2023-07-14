# frozen_string_literal: true

class CuratedMaps::CuratedMapComponent < ViewComponent::Base
  def initialize(map:)
    @map = map
  end

end
