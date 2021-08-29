require 'rails_helper'

RSpec.describe Instrument, type: :model do

  describe 'バリデーション' do
    let(:instrument) { build(:instrument) }

    it "nameがなければ登録できない" do
      expect(FactoryBot.build(:instrument, name: "")).to_not be_valid
    end

  end

  describe 'アソシエーションのテスト' do

    context 'memberモデルとの関係' do
      it '1:Nとなっている' do
        expect(Instrument.reflect_on_association(:members).macro).to eq :has_many
      end
    end
  end
end
