class Orchestras::MembersController < ApplicationController

  def index
    @orchestra = Orchestra.find(current_orchestra.id)
    @belongings = @orchestra.belongings.where(orchestra_id: current_orchestra.id)
  end

  def update
    belonging = Belonging.find(params[:id])
    if belonging.part_top
      belonging.part_top = false
      belonging.save
      redirect_to request.referer
    else
      belonging.part_top = true
      belonging.save
      redirect_to request.referer
    end
  end

end
