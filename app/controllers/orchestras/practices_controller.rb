class Orchestras::PracticesController < ApplicationController

  def index
    @practice = Practice.new
    @practice_index = Practice.where(orchestra_id: current_orchestra.id).order(schedule: :asc)
  end

  def show
    respond_to do |format|
      format.html do
        @attendances = Attendance.where(practice_id: params[:id])
        @practice = Practice.find(params[:id])
        # 練習場所の緯度経度を取得
        results = Geocoder.search("#{@practice.place}")

        if results == []
          flash[:alert] = "該当する施設が見つかりませんでした。"
          @latlng = [35.68123620000001, 139.7671248]
        else
          @latlng = results.first.coordinates
        end
      end
      # CSV出力
      format.csv do
        practice = Practice.find(params[:id])
        @attendances = Attendance.where(practice_id: params[:id])
        send_data render_to_string, filename: "#{practice.schedule}.csv", type: :csv
      end
    end
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

  def edit
    @practice = Practice.find(params[:id])
  end

  def update
    practice = Practice.find(params[:id])
    f_params = practice_params
    start_at = Date.current.strftime('%Y-%m-%d') + " #{f_params[:'start_time(4i)']}:" + "#{f_params[:'start_time(5i)']}"
    end_at = Date.current.strftime('%Y-%m-%d') + " #{f_params[:'end_time(4i)']}:" + "#{f_params[:'end_time(5i)']}"
    practice.update(
      schedule: f_params[:schedule],
      start_time: f_params[:schedule],
      place: f_params[:place],
      stand: f_params[:stand],
      note: f_params[:note],
      start_at: start_at.in_time_zone,
      end_at: end_at.in_time_zone
    )
    flash[:notice] = "練習内容を更新"
    redirect_to orchestras_practices_path
  end

  def destroy
    practice = Practice.find(params[:id])
    practice.destroy
    flash[:notice] = "練習を削除しました。"
    redirect_to orchestras_practices_path
  end

  private

    def practice_params
      params.require(:practice).permit(:schedule, :'start_time(4i)', :'start_time(5i)', :"end_time(4i)", :"end_time(5i)", :place, :stand, :note)
    end

end
