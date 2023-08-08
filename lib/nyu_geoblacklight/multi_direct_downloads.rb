module NyuGeoblacklight
  # MultiDirectDownloads is a (NYU-specific) geoblacklight-schema parser for multi-direct-downloads field
  class MultiDirectDownloads
    attr_reader :downloads

    def initialize(document, multi_downloads_field = Settings.FIELDS.MULTI_DOWNLOADS)
      @document = document
      @multi_downloads_field = multi_downloads_field
      @downloads = parse_downloads.map { |k, v| [k, v] }
    end

    def parse_downloads
      if @document[@multi_downloads_field].nil?
        {}
      else
        JSON.parse(@document[@multi_downloads_field])
      end
    end
  end
end
