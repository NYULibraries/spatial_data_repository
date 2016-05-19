module DocumentationDownload
  extend Geoblacklight::SolrDocument

## Support for documentation references within dct_references; no constant exists for this field,
## so we refer to it via the URI string
  def documentation_download
    return references.documentation.to_hash unless references.documentation.blank?
  end

end
