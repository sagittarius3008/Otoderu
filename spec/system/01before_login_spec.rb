require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '指定の値のリンクが存在するか ログイン' do
        expect(page).to have_link "ログイン"
      end
      it '指定の値のリンクが存在するか 新規登録' do
        expect(page).to have_link "新規登録"
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it '団員のログインボタンを押すと、グループ一覧に遷移する' do
      click_on 'ログイン', match: :first
        is_expected.to eq new_member_session_path
      end
      it '団員の新規登録ボタンを押すと、会員登録画面に遷移する' do
      click_on '新規登録', match: :first
        is_expected.to eq new_member_registration_path
      end
      it '団のログインボタンを押すと、グループ一覧に遷移する' do
      find('#sign_up').click
        is_expected.to eq new_orchestra_session_path
      end
      it '団の新規登録ボタンを押すと、会員登録画面に遷移する' do
      find('#registration').click
        is_expected.to eq new_orchestra_registration_path
      end
    end

    context 'ヘッダー：ログインしていない場合の表示内容確認' do
      it '指定の値のリンクが存在するか ゲストログイン(団員)' do
        expect(page).to have_link "個人"
      end
      it '指定の値のリンクが存在するか ゲストログイン(団体)' do
        expect(page).to have_link "団体"
      end
    end
  end

  describe '団員会員登録のテスト' do
    before do
      visit new_member_registration_path
    end

    context '表示内容の確認' do
      it '新規会員登録のURLが正しい' do
        expect(current_path).to eq '/members/sign_up'
      end
      it '「新規団員登録」と表示される' do
        expect(page).to have_content '新規団員登録'
      end
      it '姓フォームが表示される' do
        expect(page).to have_field 'member[family_name]'
      end
      it '名フォームが表示される' do
        expect(page).to have_field 'member[given_name]'
      end
      it 'セイフォームが表示される' do
        expect(page).to have_field 'member[family_name_kana]'
      end
      it '姓フォームが表示される' do
        expect(page).to have_field 'member[family_name_kana]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'member[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'member[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'member[password_confirmation]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'member[instrument_id]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '奏でる'
      end
    end

    context '新規登録成功のテスト' do
      before do
        FactoryBot.create(:instrument)
        fill_in 'member[family_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'member[given_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'member[family_name_kana]', with: Faker::Lorem.characters(number: 5)
        fill_in 'member[given_name_kana]', with: Faker::Lorem.characters(number: 5)
        fill_in 'member[email]', with: Faker::Internet.email
        password = Faker::Internet.password(min_length: 8)
        fill_in 'member[password]', with: password
        fill_in 'member[password_confirmation]', with: password
        # https://qiita.com/jnchito/items/607f956263c38a5fec24#%E3%82%BB%E3%83%AC%E3%82%AF%E3%83%88%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AE%E5%A0%B4%E5%90%88
        select 'Va', from: 'member[instrument_id]'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Member.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、団体申請画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/members/orchestras'
      end
    end
  
  describe 'マイページのテスト' do
    before do
      visit members_members_mypage_path
    end
    
    context 'ヘッダーの表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/members/member/mypage'
      end
    end
  end
  
  end
end