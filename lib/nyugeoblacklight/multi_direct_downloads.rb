module NyuGeoblacklight
  # MultiDirectDownloads is a (NYU-specific) geoblacklight-schema parser for multi-direct-downloads field
  class MultiDirectDownloads
    #attr_reader :refs, :reference_field
    def initialize(document, multi_downloads_field = Settings.FIELDS.MULTI_DOWNLOADS)
      @document = document
      @multi_downloads_field = multi_downloads_field
      @downloads = parse_downloads.map{ |k,v| [k, v] }
    end

    def parse_downloads
      downloads = {}
      if @document[@multi_downloads_field].nil?
        {}
      else
        downloads = JSON.parse(@document[@multi_downloads_field])
      end
    end

    def downloads
      @downloads
    end

  end
end