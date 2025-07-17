# frozen_string_literal: true

module NyuGeoblacklight
  class WmsLayer < Geoblacklight::WmsLayer
    def initialize(params)
      # Overriding to strip proxy from WMS requests made by Rails app
      params['URL'].gsub!('http://proxy.library.nyu.edu/login?url=', '')

      super
    end
  end
end
