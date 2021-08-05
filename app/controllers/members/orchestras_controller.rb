class Members::OrchestrasController < ApplicationController

  def index
    @orchestras = Orchestra.all
  end

  def create
    orchestra_id = params[:orchestra_id]
    member_id = current_member.id
    belonging = Belonging.new(orchestra_id: orchestra_id, member_id: member_id, part_top: false )
    if belonging.save!
      flash[:notice] = "入団おめでとうございます。"
      redirect_to request.referer
    else
      flash[:notice] = "入団処理にエラーが生じました。"
      redirect_to request.referer
    end
  end
  
end
