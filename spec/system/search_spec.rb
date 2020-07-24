require 'rails_helper'

RSpec.describe '検索のテスト', type: :system do
  describe '検索' do
    let!(:user) { create(:user) }
    let!(:article) {create(:article, user: user)}
    before do
      visit root_path
    end
    it '未ログイン時のタイトル検索が可能' do
      fill_in 'search-form', with: '東京'
      select 'タイトル', from: 'option'
      click_button '記事名検索'

      expect(page).to have_content '東京旅'
    end
  end
end