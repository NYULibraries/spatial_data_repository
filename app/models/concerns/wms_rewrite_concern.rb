# frozen_string_literal: true

require 'open-uri'
module WmsRewriteConcern
  extend Geoblacklight::SolrDocument

  def viewer_endpoint
    if nyu_restricted?
      'http://proxy.library.nyu.edu/login?url=https://maps-restricted.geo.nyu.edu/geoserver/sdr/wms?'
    else
      super
    end
  end

  def nyu_restricted?
    nyu? && restricted?
  end

  def nyu?
    fetch(:dct_provenance_s).downcase == 'nyu'
  end
end