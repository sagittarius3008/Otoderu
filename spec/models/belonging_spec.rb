require 'rails_helper'

RSpec.describe Belonging, type: :model do

  describe 'バリデーション' do
    let(:belonging) { build(:belonging) }

    it "orchestra_idがなければ登録できない" do
      expect(FactoryBot.build(:belonging, orchestra_id: "")).to_not be_valid
    end

    it "member_idがなければ登録できない" do
      expect(FactoryBot.build(:belonging, member_id: "")).to_not be_valid
    end

    it "パートトップ設定がなければ登録できない" do
      expect(FactoryBot.build(:belonging, part_top: "")).to_not be_valid
    end

    it "belonging_statusがなければ登録できない" do
      expect(FactoryBot.build(:belonging, belonging_status: "")).to_not be_valid
    end

  end

  describe 'アソシエーションのテスト' do

    context 'orchestraモデルとの関係' do
      it '1:Nとなっている' do
        expect(Belonging.reflect_on_association(:orchestra).macro).to eq :belongs_to
      end
    end

    context 'memberモデルとの関係' do
      it '1:Nとなっている' do
        expect(Belonging.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end
  end
end
