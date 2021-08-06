class Members::AttendancesController < ApplicationController

  def index
    @member = Member.find_by(id: current_member.id)
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.attendance_status = params[:attendance][:attendance_status]
    attendance.note = params[:attendance][:note]
    if attendance.save
      flash[:notice] = "情報が更新できました。"
      redirect_to request.referer
    else
      flash[:notice] = "更新に失敗しました。"
      redirect_to request.referer
    end
  end

end
