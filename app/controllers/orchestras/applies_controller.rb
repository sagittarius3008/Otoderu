class Orchestras::AppliesController < ApplicationController

  def index
    @applies = Apply.where(orchestra_id: current_orchestra)
  end

  private

    def apply_params
      params.permit(:orchestra_id)
    end

end
