module RelationsConcern
  extend Geoblacklight::SolrDocument

  def relations
    @relations ||= Relations.new(self)
  end

end