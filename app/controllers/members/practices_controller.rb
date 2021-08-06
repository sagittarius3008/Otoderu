class Members::PracticesController < ApplicationController

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id])
  end

end
