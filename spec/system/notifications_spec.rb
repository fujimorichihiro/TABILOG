require 'rails_helper'

RSpec.describe '通知テスト', type: :system do
  describe '通知作成のテスト' do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:article) { create(:article, user: user2)}
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    it 'いいねした時、通知が作成される' do
      visit article_path(1)
      expect(page).to have_content ''
    end
    it 'ストックした時、通知が作成される' do
      expect(page).to have_content ''
    end
    it 'コメントした時、通知が作成される' do
      expect(page).to have_content ''
    end
    it 'フォローした時、通知が作成される' do
      expect(page).to have_content ''
    end
  end
end