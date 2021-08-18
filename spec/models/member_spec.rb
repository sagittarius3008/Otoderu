require 'rails_helper'

RSpec.describe 'Memberモデルのテスト', type: :model do
  describe 'バリデーション' do
    let(:member) { build(:member) }
  #   subject { member.valid? }
    # createとbuildの違いがわからない。
    # build:作れないデータ入れても作れてしまう。意味ない
    # it '2文字以上であること: 1文字はNG' do
      #   member.family_name = Faker::Lorem.characters(number: 6)
      #   is_expected.to eq false
      # end
      
      # it "given_nameが9文字以上であれば登録できないこと" do
      #   FactoryBot.create(:instrument)
      #   member = create(:member, given_name: "一太郎喜左衛門将時能")
      #   member.valid?
      #   expect(member.errors[:family_name]).to include("Given nameは9文字以内で入力してください")
      # end

    it "姓名、セイメイ、メールアドレス、パスワード、楽器の選択があると登録ができる" do
      FactoryBot.create(:instrument)
      expect(FactoryBot.create(:member)).to be_valid
    end

    it "姓がなければ登録できない" do
      expect(FactoryBot.build(:member, family_name: "")).to_not be_valid
    end
  
    it "名がなければ登録できない" do
      expect(FactoryBot.build(:member, given_name: "")).to_not be_valid
    end

    it "セイがなければ登録できない" do
      expect(FactoryBot.build(:member, family_name_kana: "")).to_not be_valid
    end

    it "メイがなければ登録できない" do
      expect(FactoryBot.build(:member, given_name_kana: "")).to_not be_valid
    end

    it "メールアドレスがなければ登録できない" do
      expect(FactoryBot.build(:member, email: "")).to_not be_valid
    end

    it "メールアドレスが重複していたら登録できない" do
      member1 = FactoryBot.build(:member, email: "taro1@example.com")
      expect(FactoryBot.build(:member, email: member1.email)).to_not be_valid
    end

    it "パスワードがなければ登録できない" do
      expect(FactoryBot.build(:member, password: "")).to_not be_valid
    end

    it "楽器の選択がなければ登録できない" do
      expect(FactoryBot.build(:member, instrument_id: "")).to_not be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    
    context 'instrumentモデルとの関係' do
      it 'N:1となっている' do
        expect(Member.reflect_on_association(:instrument).macro).to eq :belongs_to
      end
    end
    
    context 'attendanceモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:attendances).macro).to eq :has_many
      end
    end
    
    context 'belongingモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:belongings).macro).to eq :has_many
      end
    end
    
    context 'applyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:applies).macro).to eq :has_many
      end
    end
    
    context 'orchestraモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:orchestras).macro).to eq :has_many
      end
    end
    
    context 'practicesモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:practices).macro).to eq :has_many
      end
    end
    
  end
end