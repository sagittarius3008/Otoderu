class Members::PracticesController < ApplicationController
  include Nav
  before_action :un_answered

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id]).includes([:member])
    results = Geocoder.search("#{@practice.place}")
    if results == []
      flash[:alert] = "該当する施設が見つかりませんでした。"
      @latlng = [35.68123620000001, 139.7671248]
    else
      @latlng = results.first.coordinates
    end
  end
end
