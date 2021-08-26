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
    if attendance.save
      flash[:notice] = "情報が更新できました。"
      @member = Member.find_by(id: current_member.id)
    else
      flash[:notice] = "更新に失敗しました。"
    end
  end

end
