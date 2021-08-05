class Members::MembersController < ApplicationController

  def mypage
    @member = Member.find(current_member.id)
  end

  def show
    @member = Member.find(current_member.id)
  end

  def edit
  end

  def update
  end

  def attendance_edit
  end

end
