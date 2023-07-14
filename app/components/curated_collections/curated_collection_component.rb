# frozen_string_literal: true

class CuratedCollections::CuratedCollectionComponent < ViewComponent::Base
  def initialize(collection:)
    @collection = collection
  end

end
