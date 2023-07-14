# frozen_string_literal: true

class CuratedMaps::CuratedMapsComponent < ViewComponent::Base
  def initialize(maps:)
    @maps = maps
  end

end
