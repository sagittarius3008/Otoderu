class Members::OrchestrasController < ApplicationController

  def index
    @orchestras = Orchestra.all
  end

  # 入団処理
  def create
    orchestra_id = current_orchestra.id
    member_id = params[:member][:member_id]
    belonging = Belonging.new(orchestra_id: orchestra_id, member_id: member_id, part_top: false )
    if belonging.save
      # 入団以前に設定された練習の情報も持たせる
      orchestra = Orchestra.find(orchestra_id)
      orchestra.practices.each do |practice|
        attendance = Attendance.new(practice_id: practice.id, member_id: member_id)
        attendance.save
      end
      Apply.find(params[:member][:apply_id]).destroy!
      redirect_to request.referer
    else

      redirect_to request.referer
    end
  end

end
