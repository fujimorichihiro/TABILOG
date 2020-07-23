require 'rails_helper'

RSpec.describe 'お問い合わせのテスト', type: :system do
  describe '新規問い合わせ' do
    before do
      user = create(:user, email: 'foo@tabilog.com')
      visit new_user_session_path
      fill_in 'user[email]', with: 'foo@tabilog.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    it '未ログイン時、問い合わせに成功する' do
      click_link 'ログアウト'
      visit new_inquiry_path
      fill_in 'inquiry[email]', with: Faker::Internet.email
      fill_in 'inquiry[title]', with: 'お問い合わせ'
      fill_in 'inquiry[body]', with: 'お問い合わせ'
      click_button '送信する'

      expect(page).to have_content 'お問い合わせを受け付けました。'
    end
    it 'ログイン時、問い合わせに成功する' do
      visit new_inquiry_path
      fill_in 'inquiry[title]', with: 'お問い合わせ'
      fill_in 'inquiry[body]', with: 'お問い合わせ'
      click_button '送信する'

      expect(page).to have_content 'お問い合わせを受け付けました。'
    end
  end
end