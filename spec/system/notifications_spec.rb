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
      visit article_path(id: 1)
      click_link('favolite')
      click_link 'ログアウト'
      visit new_user_session_path
      fill_in 'user[email]', with: user2.email
      fill_in 'user[password]', with: user2.password
      click_button 'ログイン'

      find_by_id('notification-circle')
    end
    it 'ストックした時、通知が作成される' do
      visit article_path(id: 1)
      click_link('stock')
      click_link 'ログアウト'
      visit new_user_session_path
      fill_in 'user[email]', with: user2.email
      fill_in 'user[password]', with: user2.password
      click_button 'ログイン'

      find_by_id('notification-circle')
    end
    it 'コメントした時、通知が作成される' do
      visit article_path(id: 1)
      fill_in 'comment[body]', with: "コメントテスト"
      click_button('コメント')
      click_link 'ログアウト'
      visit new_user_session_path
      fill_in 'user[email]', with: user2.email
      fill_in 'user[password]', with: user2.password
      click_button 'ログイン'

      find_by_id('notification-circle')
    end
    it 'フォローした時、通知が作成される' do
      visit article_path(id: 1)
      click_link('follow')
      click_link 'ログアウト'
      visit new_user_session_path
      fill_in 'user[email]', with: user2.email
      fill_in 'user[password]', with: user2.password
      click_button 'ログイン'

      find_by_id('notification-circle')
    end
  end
end