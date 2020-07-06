require 'rails_helper'

RSpec.describe 'ユーザーのテスト', type: :system do
  describe '会員登録' do
    before do
      visit new_user_session_path
    end
    it '新規登録に成功する' do
      fill_in 'user[name]', with: Faker::Name.name
      fill_in 'user[email]', with: 'foo@hoge.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '会員登録'

      expect(page).to have_content 'アカウント登録を受け付けました。確認メールから認証をお願いします。'
    end
  end
end