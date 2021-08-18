class Members::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @orchestra = Orchestra.find(params[:orchestra][:id])
  end

  def mypage
    @member = Member.find(current_member.id)
    # 自身の直近の練習情報を取得
    unless @member.practices == [] #練習予定がなければ無視する
      @most_recent_date = @member.practices.first.schedule
      @member.practices.each do |my_practice|
        if (@most_recent_date - Date.today).abs >= (my_practice.schedule - Date.today).abs
          # if my_practice.schedule - Date.today >= 0
            # byebug
          # if my_attendance.attendance_status == 0
            @most_recent_practice = my_practice
            @most_recent_date = my_practice.schedule
          # end
          # end
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
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

    def member_params
      params.require(:member).permit( :family_name, :family_name_kana, :given_name, :given_name_kana, :email, :instrument_id, :introduction )
    end

end
