class Orchestras::PracticesController < ApplicationController

  def index
    @practice = Practice.new
    @practice_index = Practice.where(orchestra_id: current_orchestra.id).order(schedule: :asc)
  end

  def show
    @practice = Practice.find(params[:id])
    @attendances = Attendance.where(practice_id: params[:id])
  end

  def create
    # 時間データを"2000-01-01 00:00:00"の形に加工
    f_params = practice_params
    start_at = Date.current.strftime('%Y-%m-%d') + " #{f_params[:'start_time(4i)']}:" + "#{f_params[:'start_time(5i)']}"
    end_at = Date.current.strftime('%Y-%m-%d') + " #{f_params[:'end_time(4i)']}:" + "#{f_params[:'end_time(5i)']}"
    practice = Practice.new(
      orchestra_id: current_orchestra.id,
      schedule: f_params[:schedule],
      start_time: f_params[:schedule],
      place: f_params[:place],
      stand: f_params[:stand],
      note: f_params[:note],
      start_at: start_at.in_time_zone,
      end_at: end_at.in_time_zone
    )
    if practice.save
      # 所属する全てのmemberに対して、出欠データを作成する。
      # 後から入団したmemberにはデータが作られていない（要修正）
      # seedファイル参照？
      members = current_orchestra.belongings.map{|belonging| belonging.member }
      members.each do |member|
        attendance = Attendance.new(practice_id: practice.id)
        attendance.member_id = member.id
        attendance.save
      end
      flash[:notice] = "練習追加に成功しました。"
      redirect_to request.referer
    else
      flash[:notice] = "未入力の項目があります。"
      redirect_to request.referer
    end
  end

  def update
  end

  def destroy
  end

  private

    def practice_params
      params.require(:practice).permit(:schedule, :'start_at(4i)', :'start_at(5i)', :"end_at(4i)", :"end_at(5i)", :place, :stand, :note)
    end

end
