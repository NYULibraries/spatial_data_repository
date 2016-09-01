module DocumentationDownload
  extend Geoblacklight::SolrDocument

## Support for documentation references within dct_references; no constant exists for this field,
## so we refer to it via the URI string
  def documentation_download
    return references.data_dictionary.to_hash unless references.data_dictionary.blank?
  end

end
