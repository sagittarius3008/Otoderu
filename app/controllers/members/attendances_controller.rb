class Members::AttendancesController < ApplicationController
  include Nav
  before_action :un_answered

  def index
    @member = Member.find_by(id: current_member.id)
    @practices = @member.practices.includes(:orchestra)
    # セレクトボックスに使用→model
    @names = []
    @member.orchestras.each do |orchestra|
      @names << orchestra.name
    end
  end

  def search
    @member = Member.find_by(id: current_member.id)
    @practices = @member.practices.includes(:orchestra)
    @orchestra = Orchestra.search(params[:search])
    @names = []
    @member.orchestras.each do |orchestra|
      @names << orchestra.name
    end
    render 'index'
  end

  def show
    @orchestra = Orchestra.find(params[:id])
    @members = @orchestra.members.includes(:instrument)
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.attendance_status = params[:attendance][:attendance_status]
    attendance.note = params[:attendance][:note]
    attendance.save
    @member = Member.find_by(id: current_member.id)
  end

  def update_all
    # TODO!! 本日以降の予定をアップデート
    Attendance.where(member_id:current_member.id).update_all(attendance_status: params[:attendance_status])
    redirect_to request.referer
  end
end
