class Members::AppliesController < ApplicationController

  def create
    apply = Apply.new(orchestra_id: params[:orchestra][:orchestra_id], member_id: current_member.id)
    apply.save
    redirect_to request.referer
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy!
    redirect_to request.referer
  end

  private

    def apply_params
      params.permit(:orchestra_id)
    end

end
