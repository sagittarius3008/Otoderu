class Members::PracticesController < ApplicationController

  def show
    @practice = Practice.find(params[:id])
  end

end
