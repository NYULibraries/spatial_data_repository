# frozen_string_literal: true

module CuratedCollections
  class CuratedCollectionsComponent < ViewComponent::Base
    def initialize(collections:, header:)
      super
      @collections = collections
      @header = header
    end
  end
end
