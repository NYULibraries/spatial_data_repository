# frozen_string_literal: true

class WmsController < ApplicationController
  before_action :format_url
  def handle
    response = Geoblacklight::WmsLayer.new(wms_params).feature_info

    respond_to do |format|
      format.json { render json: response }
    end
  end

  private

  def wms_params
    params.permit('URL', 'LAYERS', 'BBOX', 'WIDTH', 'HEIGHT', 'QUERY_LAYERS', 'X', 'Y')
  end

  def format_url
    params['URL'] = Rails.application.credentials.restricted_url if params['URL'].include? Rails.application.credentials.PROXY_URL
  end
end
