class Members::AttendancesController < ApplicationController

  def index
    @member = Member.find_by(id: current_member.id)
  end

  def show
    @orchestra = Orchestra.find(params[:id])
    @members = @orchestra.members
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.attendance_status = params[:attendance][:attendance_status]
    attendance.note = params[:attendance][:note]
    if attendance.save
      flash[:notice] = "情報が更新できました。"
      @member = Member.find_by(id: current_member.id)
    else
      flash[:notice] = "更新に失敗しました。"
    end
  end

end
