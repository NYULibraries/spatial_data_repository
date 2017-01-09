module ApplicationHelper

  def construct_curated_maps
    maps = NyuGeoblacklight::CuratedCollections.maps.shuffle[0..2]
    toReturn = "<div class=\"curated-maps\">
      <h4>Featured Maps</h4>
      <div class=\"row\">"
    maps.each do |map|
      toReturn += create_map_portion(map)
    end
    toReturn += "</div>
                </div>"
    toReturn.html_safe
  end

  def create_map_portion(map)
    toReturn = "<a class=\"curated-card\" style=\"display:block\" href=\"./catalog/#{map[:slug]}\">
          <div class=\"col-md-4\">
            <div class=\"card-map\">"
    toReturn += (image_tag "thumb/#{map[:slug]}.jpg", {:class => "card-img-top", :"data-svg-fallback" => "#{image_path('real250.png')}", :alt => 'NYU Spatial Data Repository'})
    toReturn += "<div class=\"card-block\">
                <h4 class=\"card-title\">#{map[:title]}</h4>
              </div>
            </div>
          </div>
        </a>"
    toReturn
  end

  def construct_curated_collections
    collections = NyuGeoblacklight::CuratedCollections.collections.shuffle[0..1]
    toReturn = "<div class=\"curated-collections\">
      <h4>Featured Collections</h4>
      <div class=\"row\">"
    collections.each do |collection|
      toReturn += create_collection_portion(collection)
    end
    toReturn += " </div>
    </div>"
    toReturn.html_safe
  end

  def create_collection_portion(collection)
    toReturn = link_to search_catalog_path({f: collection[:f]}), {class: "curated-card"} do
      "
    <div class=\"col-md-6\">
          <div class=\"card-collection\">
            <div class=\"card-block\">
              <h4 class=\"card-title\">#{collection[:title]}</h4>
              <p class=\"card-text\">#{collection[:description]}</p>
            </div>
          </div>
        </div>
    ".html_safe
    end
    toReturn.html_safe
  end

  def construct_recent_collections
    collections = NyuGeoblacklight::CuratedCollections.recent[0..1]
    toReturn = "<div class=\"curated-collections\">
      <h4 class=\"collection-section-title\">Recently Updated</h4>
      <div class=\"row\">"
    collections.each do |collection|
      toReturn += create_recent_portion(collection)
    end
    toReturn += " </div>
    </div>"
    toReturn.html_safe
  end

  def create_recent_portion(collection)
    toReturn = link_to search_catalog_path({f: collection[:f]}), {class: "curated-card"} do
      "
    <div class=\"col-md-6\">
          <div class=\"card-collection\">
            <div class=\"card-block\">
              <h4 class=\"card-title\">#{collection[:title]}</h4>
              <p class=\"card-text\">#{collection[:description]}</p>
            </div>
          </div>
        </div>
    ".html_safe
    end
    toReturn.html_safe
  end


end
