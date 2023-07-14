# frozen_string_literal: true

module ApplicationHelper
  def construct_curated_maps
    maps = NyuGeoblacklight::CuratedCollections.maps.sample(3)
    to_return = "<div class=\"curated-maps\">
      <h4>Featured Maps</h4>
      <div class=\"row\">"
    maps.each do |map|
      to_return += create_map_portion(map)
    end
    to_return += "</div>
                </div>"
    to_return.html_safe
  end

  def download_text_alt(format)
    "#{t 'geoblacklight.download.download'} #{proper_case_format_alt(format)}".html_safe
  end

  def proper_case_format_alt(format)
    t "geoblacklight.formats.#{format.downcase}" || format
  end

  def download_text_laefer_alt(format)
    format.to_s.html_safe
  end

  def create_map_portion(map)
    to_return = "<a class=\"curated-card\" style=\"display:block\" href=\"./catalog/#{map[:slug]}\">
          <div class=\"col-md-4\">
            <div class=\"card-map\">"
    to_return += (image_tag "thumb/#{map[:slug]}.jpg", { class: 'card-img-top', "data-svg-fallback": image_path('real250.png').to_s, alt: 'NYU Spatial Data Repository' })
    to_return += "<div class=\"card-block\">
                <h4 class=\"card-title\">#{map[:title]}</h4>
              </div>
            </div>
          </div>
        </a>"
    to_return
  end

  def construct_curated_collections
    collections = NyuGeoblacklight::CuratedCollections.collections.sample(2)
    to_return = "<div class=\"curated-collections\">
      <h4>Featured Collections</h4>
      <div class=\"row\">"
    collections.each do |collection|
      to_return += create_collection_portion(collection)
    end
    to_return += " </div>
    </div>"
    to_return.html_safe
  end

  def create_collection_portion(collection)
    to_return = link_to search_catalog_path({ f: collection[:f] }), { class: 'curated-card' } do
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
    to_return.html_safe
  end

  def construct_recent_collections
    collections = NyuGeoblacklight::CuratedCollections.recent[0..1]
    to_return = "<div class=\"curated-collections\">
      <h4 class=\"collection-section-title\">Recently Updated</h4>
      <div class=\"row\">"
    collections.each do |collection|
      to_return += create_recent_portion(collection)
    end
    to_return += " </div>
    </div>"
    to_return.html_safe
  end

  def create_recent_portion(collection)
    to_return = link_to search_catalog_path({ f: collection[:f] }), { class: 'curated-card' } do
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
    to_return.html_safe
  end
end
