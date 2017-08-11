module MultiDownloadConcern
  extend Geoblacklight::SolrDocument

  def multi_direct_downloads
    NyuGeoblacklight::MultiDirectDownloads.new(self).downloads
  end
end
