class WmsController < ApplicationController
before_action :format_url
  def handle
    response = Geoblacklight::WmsLayer.new(params).feature_info

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def format_url
    params['URL'] = Settings.RESTRICTED_URL if params['URL'].include? Settings.PROXY_URL
 end

end