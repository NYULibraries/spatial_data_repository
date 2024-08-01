# frozen_string_literal: true

module Catalog
  class DownloadsCollapseComponent < ViewComponent::Base
    def initialize(document:)
      @document = document
    end
  end
end
