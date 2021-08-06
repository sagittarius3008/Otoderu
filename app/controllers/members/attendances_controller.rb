class Members::AttendancesController < ApplicationController

  def index
    @orchestra = Orchestra.find(params[:id])
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

end
