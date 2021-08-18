require 'rails_helper'

RSpec.describe Apply, type: :model do

  describe 'バリデーション' do
    let(:apply) { build(:apply) }

    it "member_idがなければ登録できない" do
      expect(FactoryBot.build(:apply, member_id: "")).to_not be_valid
    end

    it "orchestra_idがなければ登録できない" do
      expect(FactoryBot.build(:apply, orchestra_id: "")).to_not be_valid
    end

  end

  describe 'アソシエーションのテスト' do

    context 'orchestraモデルとの関係' do
      it '1:Nとなっている' do
        expect(Apply.reflect_on_association(:orchestra).macro).to eq :belongs_to
      end
    end

    context 'memberモデルとの関係' do
      it '1:Nとなっている' do
        expect(Apply.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end
  end
end
