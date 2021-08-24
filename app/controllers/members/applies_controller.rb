class Members::AppliesController < ApplicationController
  # before_action :authenticate_member!

  def create
    apply = Apply.new(orchestra_id: params[:orchestra][:orchestra_id], member_id: current_member.id)
    apply.save
    flash[:notice] = "入団申請を行いました"
    redirect_to request.referer
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy!
    flash[:notice] = "申請を取り消しました"
    redirect_to request.referer
  end

  private

    def apply_params
      params.permit(:orchestra_id)
    end

end
