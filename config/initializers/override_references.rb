## This initializer used to override the corresponding Geoblacklight base class
## Required in order to accomodate multi-formats and multi-download-links
##
## - sgb 4/21/2017

module Geoblacklight
  # References is a geoblacklight-schema dct:references parser
  class References
    attr_reader :refs, :reference_field
    def initialize(document, reference_field = Settings.FIELDS.REFERENCES)
      @document = document
      @reference_field = reference_field
      @refs = parse_references.map { |ref| Reference.new(ref) }
    end

    ##
    # Accessor for a document's file format
    # @return [String] file format for the document
    def format
      if @document[Settings.FIELDS.FILE_FORMAT].nil?
        nil
      else
        @document[Settings.FIELDS.FILE_FORMAT][0]
      end
    end

    ##
    # @param [String, Symbol] ref_type
    # @return [Geoblacklight::Reference]
    def references(ref_type)
      @refs.find { |reference| reference.type == ref_type }
    end

    ##
    # Preferred download (should be a file download)
    # @return [Hash, nil]
    def preferred_download
      return file_download unless download.blank?
    end

    ##
    # Download hash based off of format type
    # @return [Hash, nil]
    def downloads_by_format
      case format
        when 'Shapefile'
          vector_download_formats
        when 'GeoTIFF'
          geotiff_download_formats
        when 'ArcGRID'
          arcgrid_download_formats
      end
    end

    ##
    # Generated download types from wxs services
    # @return (see #downloads_by_format)
    def download_types
      downloads_by_format
    end

    private

    ##
    # Parses the references field of a document
    # @return [Hash]
    def parse_references
      if @document[reference_field].nil?
        {}
      else
        JSON.parse(@document[reference_field])
      end
    end

    ##
    # Download hash for a static file download
    # @return (see #downloads_by_format)
    def file_download
      { file_download: download.to_hash }
    end

    ##
    # Download hash for a Shapefile file (currently only vector) with a wms and wfs reference
    # present
    # @return (see #downloads_by_format)
    def vector_download_formats
      { shapefile: wfs.to_hash,
        kmz: wms.to_hash,
        geojson: wfs.to_hash } if wms.present? && wfs.present?
    end

    ##
    # Download hash for a GeoTiff file with a WMS reference present
    # @return (see #downloads_by_format)
    def geotiff_download_formats
      { geotiff: wms.to_hash } if wms.present?
    end

    ##
    # Download hash for an ArcGRID file with a WMS reference present
    # @return (see #downloads_by_format)
    def arcgrid_download_formats
      { geotiff: wms.to_hash } if wms.present?
    end

    ##
    # Adds a call to references for defined URI keys
    def method_missing(m, *args, &b)
      if Geoblacklight::Constants::URI.key?(m)
        references m
      else
        super
      end
    end
  end
end