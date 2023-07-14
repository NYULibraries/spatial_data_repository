# frozen_string_literal: true

class CuratedCollections::CuratedCollectionsComponent < ViewComponent::Base
  def initialize(collections:)
    @collections = collections
  end

end
