require 'rails_helper'

RSpec.describe "Articleモデル", type: :model do
  describe "バリデーションのテスト" do

    context "title" do
      it "空欄なら無効" do
        article = build(:article, title: "")
        article.valid?
        expect(article.errors[:title]).to include("を入力してください")
      end

      it "31文字以上なら無効" do
        article = build(:article, title: Faker::String.random(length: 31))
        article.valid?
        expect(article.errors[:title]).to include("は30文字以内で入力してください")
      end
    end

    context "body" do
      it "空欄なら無効" do
        article = build(:article, body: "")
        article.valid?
        expect(article.errors[:body]).to include("を入力してください")
      end
    end
  end
end
