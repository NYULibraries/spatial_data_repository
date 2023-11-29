# frozen_string_literal: true

module CuratedCollections
  class CuratedCollectionComponent < ViewComponent::Base
    def initialize(collection:)
      super
      @collection = collection
    end
  end
end
