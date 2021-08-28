class MapsController < ApplicationController
  def map
    results = Geocoder.search(params[:address]) #viewで得た:addressをresultに変数に代入
    unless results == []
      @latlng = results.first.coordinates
    else
      flash[:alert] = "該当する施設が見つかりませんでした。"
      @latlng = [35.68123620000001, 139.7671248]
    end
    respond_to do |format|
      format.js
    end
  end
end
