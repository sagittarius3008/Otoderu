require 'rails_helper'

RSpec.describe Orchestra, type: :model do

  describe 'バリデーション' do
    let(:orchestra) { build(:orchestra) }
    let(:other_orchestra) { build(:orchestra) }

  it "団体名がなければ登録できない" do
    expect(FactoryBot.build(:orchestra, name: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:orchestra, email: "")).to_not be_valid
  end

  # falseになるのはtrue判定されない
  # it "メールアドレスが重複していたら登録できない" do
  #   orchestra.email == other_orchestra.email
  #   is_expected.to eq false
  # end
  end

  describe 'アソシエーションのテスト' do

    context 'belongingモデルとの関係' do
      it '1:Nとなっている' do
        expect(Orchestra.reflect_on_association(:belongings).macro).to eq :has_many
      end
    end
    
    context 'applyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Orchestra.reflect_on_association(:applies).macro).to eq :has_many
      end
    end
    
    context 'practiceモデルとの関係' do
      it '1:Nとなっている' do
        expect(Orchestra.reflect_on_association(:practices).macro).to eq :has_many
      end
    end  
    
    context 'memberモデルとの関係' do
      it '1:Nとなっている' do
        expect(Orchestra.reflect_on_association(:members).macro).to eq :has_many
      end
    end
    
  end
end
