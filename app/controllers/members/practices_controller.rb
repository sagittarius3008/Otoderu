class Members::PracticesController < ApplicationController

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id])
    results = Geocoder.search("#{@practice.place}")
    @latlng = results.first.coordinates
  end

end
