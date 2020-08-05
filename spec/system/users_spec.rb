require 'rails_helper'

RSpec.describe 'ユーザーのテスト', type: :system do
  describe '会員登録' do
    before do
      visit new_user_registration_path
    end
    it '新規登録に成功する' do
      expect(page).to have_content '会員登録'
      fill_in 'user[name]', with: Faker::Name.name
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '会員登録'

      expect(page).to have_content 'アカウント登録を受け付けました。確認メールから認証をお願いします。'
    end
    it '新規登録に失敗する' do
      expect(page).to have_content '会員登録'
      fill_in 'user[name]', with: ''
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'passwo'
      click_button '会員登録'

      expect(page).to have_content 'ユーザーネーム を入力してください'
    end
  end
  describe 'ログイン' do
    before do
      visit new_user_session_path
    end
    it 'ログインに成功する。' do
      user = create(:user, email: 'foo@tabilog.com')
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました。'
    end
    it 'ログインに失敗する。' do
      user = create(:user, email: 'foo@tabilog.com')
      fill_in 'user[email]', with: 'foo@tabilog.co'
      fill_in 'user[password]', with: 'passwor'
      click_button 'ログイン'

      expect(page).to have_content 'メールアドレスかパスワードが違います'
    end
  end
  describe 'ログアウト' do
    before do
      user = create(:user, email: 'foo@tabilog.com')
      visit new_user_session_path
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    it 'ログアウトに成功する。' do
      click_link 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end
  describe 'プロフィール編集' do
    before do
      visit new_user_session_path
      user = create(:user, email: 'foo@tabilog.com')
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'

      visit edit_user_path
    end
    it 'ユーザーネームの変更に成功する' do
      fill_in 'user[name]', with: '旅ログ太郎'
      click_link '更新'

      expect(page).to have_content '旅ログ太郎'
    end
    it '自己紹介の編集に成功する。' do
    end
  end
end