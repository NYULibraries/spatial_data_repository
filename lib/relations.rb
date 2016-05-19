class Relations

  def initialize(document)
    @document = document
    @solr = RSolr.connect :url => ENV['SOLR_URL']
  end

  def ancestors
    unless @document['dct_source_sm'].blank?
      query = @solr.get 'select', :params => {:q => "layer_slug_s:#{@document['dct_source_sm'].join('OR')}", :fl => ['dc_title_s', 'layer_slug_s']}
      query['response']['docs']
    end
  end

  def descendents
    query = @solr.get 'select', :params => {:q => "dct_source_sm:#{@document['layer_slug_s']}", :fl => ['dc_title_s', 'layer_slug_s']}
    query['response']['docs']
  end

  def exist?
    !ancestors.blank? || !descendents.blank?
  end

end