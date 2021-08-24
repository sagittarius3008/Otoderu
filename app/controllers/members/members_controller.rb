class Members::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @orchestra = Orchestra.find(params[:orchestra][:id])
  end

  def mypage
    @member = Member.find(current_member.id)
    # 自身の直近の練習情報を取得
    unless @member.practices == []
      @most_recent_date = @member.practices.first.schedule
      @member.practices.each do |my_practice|
        if my_practice.schedule - Date.today >= 0
          if (@most_recent_date - Date.today).abs >= (my_practice.schedule - Date.today).abs
            @most_recent_practice = my_practice
            @most_recent_date = my_practice.schedule
          end
        end
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
    @instruments = Instrument.all
  end

  def update
    member = Member.find(params[:id])
    if member.update(member_params)
      flash[:notice] = "情報を更新しました"
      redirect_to request.referer
    else
      flash[:notice] = "内容を再度確認してください"
      redirect_to request.referer
    end
  end

  private

    def member_params
      params.require(:member).permit( :family_name, :family_name_kana, :given_name, :given_name_kana, :email, :instrument_id, :introduction )
    end

end
