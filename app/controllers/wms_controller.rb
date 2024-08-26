# frozen_string_literal: true

class WmsController < ApplicationController
  def handle
    # Overriding to use NYU Specific WMS Layer class
    response = NyuGeoblacklight::WmsLayer.new(wms_params).feature_info

    respond_to do |format|
      format.json { render json: response }
    end
  end

  private

  def wms_params
    params.permit(Settings.GBL_PARAMS)
  end
end
