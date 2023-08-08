# frozen_string_literal: true

module Blacklight
  class DocumentMetadataRestrictedComponent < Blacklight::Component
    def initialize(document:)
      super
      @document = document
    end

    def render?
      @document.present?
    end
  end
end
