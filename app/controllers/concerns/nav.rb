module Nav
  extend ActiveSupport::Concern

  def new_apply
    @nav_applies = Apply.where(orchestra_id: current_orchestra)
  end

  def un_answered
    @nav_attendances = Member.find(current_member.id).attendances
    @count = 0
    @nav_attendances.each do |attendance|
      if attendance.attendance_status == "未入力"
        @count += 1
      end
    end
  end
end
