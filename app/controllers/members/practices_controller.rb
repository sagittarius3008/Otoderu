class Members::PracticesController < ApplicationController

  def index
    @practice_index = Practice.where(orchestra_id: current_orchestra.id).order(schedule: :asc)
  end

  def show

  end

end
