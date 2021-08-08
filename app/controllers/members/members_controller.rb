class Members::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def mypage
    @member = Member.find(current_member.id)
    # 自身の直近の練習情報を取得
    my_attendances = Attendance.where(member_id: current_member.id)
    @most_recent_date = my_attendances.first.practice.schedule
    my_attendances.each do |my_attendance|
      if (@most_recent_date - Date.today).abs >= (my_attendance.practice.schedule - Date.today).abs && my_attendance.practice.schedule - Date.today >= 0
        # if my_attendance.attendance_status == 0
          @most_recent_practice = my_attendance.practice
          @most_recent_date = my_attendance.practice.schedule
          @most_recent_date_orchestra = my_attendance.practice.orchestra.name
        # end
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
      # flash[:notice] = "情報が更新できました。"
      redirect_to request.referer
    else
      # flash[:notice] = "入力内容を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  def attendance_edit
    @orchestra = Orchestra.find(params[:id])
  end

  private

    def member_params
      params.require(:member).permit( :family_name, :family_name_kana, :given_name, :given_name_kana, :email, :instrument_id, :introduction )
    end

end
