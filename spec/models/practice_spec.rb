require 'rails_helper'

RSpec.describe Practice, type: :model do

  describe 'バリデーション' do
    let(:practice) { build(:practice) }

    it "orchestra_idがなければ登録できない" do
      expect(FactoryBot.build(:practice, orchestra_id: "")).to_not be_valid
    end

    it "日程がなければ登録できない" do
      expect(FactoryBot.build(:practice, schedule: "")).to_not be_valid
    end

    it "開始時間がなければ登録できない" do
      expect(FactoryBot.build(:practice, start_at: "")).to_not be_valid
    end

    it "終了時間がなければ登録できない" do
      expect(FactoryBot.build(:practice, end_at: "")).to_not be_valid
    end

    it "練習場所の設定がなければ登録できない" do
      expect(FactoryBot.build(:practice, place: "")).to_not be_valid
    end

    it "備考がなければ登録できない" do
      expect(FactoryBot.build(:practice, note: "")).to_not be_valid
    end

    it "譜面台の有無がなければ登録できない" do
      expect(FactoryBot.build(:practice, stand: "")).to_not be_valid
    end

    it "start_timeがなければ登録できない" do
      expect(FactoryBot.build(:practice, start_time: "")).to_not be_valid
    end

  end

  describe 'アソシエーションのテスト' do

    context 'orchestraモデルとの関係' do
      it '1:Nとなっている' do
        expect(Practice.reflect_on_association(:orchestra).macro).to eq :belongs_to
      end
    end

    context 'attendanceモデルとの関係' do
      it '1:Nとなっている' do
        expect(Practice.reflect_on_association(:attendances).macro).to eq :has_many
      end
    end
  end
end
