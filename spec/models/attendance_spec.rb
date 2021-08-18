require 'rails_helper'

RSpec.describe Attendance, type: :model do

  describe 'バリデーション' do
    let(:attendance) { build(:attendance) }

    it "member_idがなければ登録できない" do
      expect(FactoryBot.build(:attendance, member_id: "")).to_not be_valid
    end
  
    it "practice_idがなければ登録できない" do
      expect(FactoryBot.build(:attendance, practice_id: "")).to_not be_valid
    end
    
    it "出欠ステータスがなければ登録できない" do
      expect(FactoryBot.build(:attendance, attendance_status: "")).to_not be_valid
    end

  end

  describe 'アソシエーションのテスト' do

    context 'memberモデルとの関係' do
      it '1:Nとなっている' do
        expect(Attendance.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end
    
    context 'practiceモデルとの関係' do
      it '1:Nとなっている' do
        expect(Attendance.reflect_on_association(:practice).macro).to eq :belongs_to
      end
    end
    
  end
end
