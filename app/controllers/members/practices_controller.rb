class Members::PracticesController < ApplicationController
  include Nav
  before_action :un_answered

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id]).includes([:member])
    results = Geocoder.search("#{@practice.place}")
      @latlng = results.first.coordinates
  end

end
