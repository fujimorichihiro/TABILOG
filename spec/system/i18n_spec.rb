require 'rails_helper'

RSpec.describe '翻訳のテスト', type: :system do
  let!(:user) { create(:user) }
  descrice '言語の切り替え' do
    before do
      visit root_path
    end
    it 'デフォルトが日本語' do
      expect(page).to have_content '場所検索'
    end
    it '日本語 >> 英語' do
      click_link 'English'
      expect(page).to have_content 'Spot'
    end
    it '日本語 >> 英語' do
      click_link 'English'
      click_link '日本語'

      expect(page).to have_content '場所検索'
    end
  end
  describe '非ログイン(日本語)' do
    it 'トップページ' do
      visit root_path

      expect(page).to have_no_content 'translation missing'
    end
    it '会員登録ページ' do
      visit new_user_registration_path

      expect(page).to have_no_content 'translation missing'
    end
    it 'ログインページ' do
      visit new_user_session_path

      expect(page).to have_no_content 'translation missing'
    end
    it 'パスワード変更メール送信ページ' do
      visit new_user_password_path

      expect(page).to have_no_content 'translation missing'
    end
    it 'アカウント確認メール再送ページ' do
      visit new_user_confirmation_path

      expect(page).to have_no_content 'translation missing'
    end
  end
  describe 'ログイン(日本語)' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    it 'マイページ' do
      visit user_path(id: user.id)

      expect(page).to have_no_content 'translation missing'
    end
    it 'プロフィール編集ページ' do
      visit edit_user_path(id: user.id)

      expect(page).to have_no_content 'translation missing'
    end
    it '登録情報編集ページ' do
      visit edit_user_registration_path

      expect(page).to have_no_content 'translation missing'
    end
  end
end