require 'rails_helper'

RSpec.describe 'お問い合わせのテスト', type: :system do
  before do
    user = create(:user, email: 'foo@tabilog.com')
    visit new_user_session_path
    fill_in 'user[email]', with: 'foo@tabilog.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
  end
  describe '新規問い合わせ' do
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
  describe 'エラーメッセージのテスト' do
    before do
      click_link 'ログアウト'
      visit new_inquiry_path
      fill_in 'inquiry[title]', with: ''
      fill_in 'inquiry[body]', with: ''
    end
    it 'メールアドレスが不正' do
      fill_in 'inquiry[email]', with: 'foo@hoge'
      click_button '送信する'
      expect(page).to have_content 'メールアドレス は不正な値です'
    end
    it 'メールアドレスが空白' do
      fill_in 'inquiry[email]', with: ''
      click_button '送信する'
      expect(page).to have_content 'メールアドレス を入力してください'
    end
    it '件名が空白' do
      fill_in 'inquiry[email]', with: ''
      click_button '送信する'
      expect(page).to have_content '件名 を入力してください'
    end
    it 'ご意見・要望が空白' do
      fill_in 'inquiry[email]', with: ''
      click_button '送信する'
      expect(page).to have_content '内容 を入力してください'
    end
  end
end