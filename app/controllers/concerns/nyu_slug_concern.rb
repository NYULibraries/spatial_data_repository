# frozen_string_literal: true

module NyuSlugConcern
  extend Blacklight::Catalog

  # Override of main show method to catch old-style
  # NYU slugs ("nyu_2451_12345") and turn them into
  # new style ("nyu-2451-12345")
  def show
    transform_id if /^nyu_\d{4}_\d{5}$/.match(params[:id])
    @response, @document = fetch_document(params[:id])

    respond_to do |format|
      format.html { setup_next_and_previous_documents }
      format.json { render json: { response: { document: @document } } }
      additional_export_formats(@document, format)
    end
  end

  private

  def transform_id
    params[:id].gsub!('_', '-')
  end

  def fetch_document(id)
    fetch(id)
  end
end
