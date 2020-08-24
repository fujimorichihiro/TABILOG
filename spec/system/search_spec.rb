require 'rails_helper'

RSpec.describe '検索のテスト', type: :system do
  let!(:user) { create(:user) }
  let!(:article) {create(:article, user: user)}
  let!(:tag1) { create(:tag) }
  let!(:tag2) { create(:tag) }
  let!(:tagging1) { create(:tagging, article: article, tag: tag1)}
  let!(:tagging2) { create(:tagging, article: article, tag: tag2)}

  describe '未ログイン' do
    before do
      visit root_path
    end
    it '未ログイン時のタイトル検索が可能' do
      fill_in 'search-form', with: '東京'
      select '記事名検索', from: 'option'
      click_button 'search-button'

      expect(page).to have_content '東京旅'
    end
    it '未ログイン時のタグ検索が可能' do
      fill_in 'search-form', with: tag1.name
      select 'タグ', from: 'option'
      click_button 'search-button'

      expect(page).to have_content '東京旅'
    end
  end

  describe 'ログイン' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'

      visit root_path
    end
    it 'タイトル検索が可能' do
      fill_in 'search-form', with: '東京'
      select '記事名検索', from: 'option'
      click_button 'search-button'

      expect(page).to have_content '東京旅'
    end
    it 'タグ検索が可能' do
      fill_in 'search-form', with: tag1.name
      select 'タグ', from: 'option'
      click_button 'search-button'

      expect(page).to have_content '東京旅'
    end
  end
end