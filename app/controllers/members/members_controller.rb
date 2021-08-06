class Members::MembersController < ApplicationController

  def mypage
    @member = Member.find(current_member.id)
  end

  def edit
    @member = Member.find(params[:id])
    @instruments = Instrument.all
  end

  def update
    member = Member.find(params[:id])
    if member.update(member_params)
      flash[:notice] = "情報が更新できました。"
      redirect_to request.referer
    else
      flash[:notice] = "入力内容を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  def attendance_edit
  end

  private

    def member_params
      params.require(:member).permit( :family_name, :family_name_kana, :given_name, :given_name_kana, :email, :instrument_id, :introduction )
    end

end
