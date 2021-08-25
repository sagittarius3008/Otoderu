class Members::PracticesController < ApplicationController

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id])
    results = Geocoder.search("#{@practice.place}")
    # unless results == []
      @latlng = results.first.coordinates
    # else
      # byebug
    # end
  end

end
