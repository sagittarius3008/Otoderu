class Members::AttendancesController < ApplicationController
  include Nav
  before_action :un_answered

  def index
    @member = Member.find_by(id: current_member.id)
    # セレクトボックス作成のため
    @names = []
    @member.orchestras.each do |orchestra|
      @names << orchestra.name
    end
  end

  def search
    @member = Member.find_by(id: current_member.id)
    @orchestra = Orchestra.search(params[:search])
    @names = []
    @member.orchestras.each do |orchestra|
      @names << orchestra.name
    end
    render 'index'
  end

  def show
    @orchestra = Orchestra.find(params[:id])
    @members = @orchestra.members
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.attendance_status = params[:attendance][:attendance_status]
    attendance.note = params[:attendance][:note]
    attendance.save
      @member = Member.find_by(id: current_member.id)
  end

end
