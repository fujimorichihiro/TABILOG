require 'rails_helper'

RSpec.describe '投稿のテスト', type: :system do
  describe '新規投稿' do
    let!(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit new_article_path
    end
    it '投稿に成功する。' do
      fill_in 'article[title]', with: Faker::String.random(length: 20)
      fill_in 'article[body]', with: '東京タワー'
      fill_in 'article[address]', with: '東京タワー'
      click_button '投稿する'

      expect(page).to have_content '編集する'
      expect(page).to have_content '削除'
    end
  end
  describe '記事詳細画面' do
    let!(:user) { create(:user) }
    let!(:article) { create(:article, title: '東京', body: '本文', address: '東京タワー', user: user)}
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit article_path(id: 1)
    end
    it 'タイトルの表示' do

      expect(page).to have_content '東京'
    end
    it '本文の表示' do

      expect(page).to have_content '本文'
    end
    it '位置情報の表示' do

      expect(page).to have_content '東京タワー'
    end
    it '記事の削除' do
      click_link('delete')
      expect(page).to have_content '東京を削除しました'
    end
    it '編集画面へ遷移' do
      click_link('edit')
      expect(page).to have_content 'タグ'
    end
  end
end