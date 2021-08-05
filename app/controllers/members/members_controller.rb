class Members::MembersController < ApplicationController

  def mypage
    @member = Member.find(current_member.id)

    @belongings = Belonging.where(member_id: current_member.id)
    @orchestras = Orchestra.all
  end

  def show
    @member = Member.find(current_member.id)
  end

  def edit
  end

  def update
  end

end
