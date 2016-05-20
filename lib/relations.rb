class Relations

  def initialize(document)
    @document = document
    solr = RSolr.connect :url => ENV['SOLR_URL']

    @ancestors = []
    unless @document['dct_source_sm'].blank?
      @ancestors = solr.get 'select', :params => {:q => "layer_slug_s:#{@document['dct_source_sm'].join('OR')}", :fl => ['dc_title_s', 'layer_slug_s']}
    end

    @descendents = solr.get 'select', :params => {:q => "dct_source_sm:#{@document['layer_slug_s']}", :fl => ['dc_title_s', 'layer_slug_s']}

    @count = {}
    @count[:ancestors] = @ancestors['response']['numFound'] unless @ancestors.blank?
    @count[:descendents] = @descendents['response']['numFound'] unless @descendents['response']['numFound'] == 0

    @search = {}
    @search[:descendents] = "catalog?f[dct_source_sm][]=#{@document['layer_slug_s']}"
  end

  def ancestors
    @ancestors['response']['docs'] unless @ancestors.blank?
  end

  def descendents
    @descendents['response']['docs']
  end

  def count
    @count
  end

  def exist?
    !@count.blank?
  end

  def search
    @search
  end

end