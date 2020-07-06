require 'rails_helper'

RSpec.describe "Inquiryモデル", type: :model do
  describe "バリデーションのテスト" do
    context "有効" do
      it "全て入力" do
        inquiry = build(:inquiry)
        expect(inquiry).to be_valid
      end
    end
    context "email" do
      it "空欄なら無効" do
        inquiry = build(:inquiry, email: "")
        inquiry.valid?
        expect(inquiry.errors[:email]).to include("を入力してください")
      end

      it "フォーマットに合わない場合無効" do
        inquiry = build(:inquiry, email: "foo")
        inquiry.valid?
        expect(inquiry.errors[:email]).to include("は不正な値です")
      end
    end
    context "title" do
      it "空欄なら無効" do
        inquiry = build(:inquiry, title: "")
        inquiry.valid?
        expect(inquiry.errors[:title]).to include("を入力してください")
      end
      it "21文字以上なら無効" do
        inquiry = build(:inquiry, title: Faker::String.random(length: 21))
        inquiry.valid?
        expect(inquiry.errors[:title]).to include("は20文字以内で入力してください")
      end
    end

    context "body" do
      it "空欄なら無効" do
        inquiry = build(:inquiry, body: "")
        inquiry.valid?
        expect(inquiry.errors[:body]).to include("を入力してください")
      end
    end
  end
end
