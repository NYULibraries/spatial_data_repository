# frozen_string_literal: true

module Catalog
  class DownloadsCollapseComponent < ViewComponent::Base
    def initialize(document:)
      super
      @document = document
    end
  end
end
