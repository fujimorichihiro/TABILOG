require 'rails_helper'

RSpec.describe "Userモデル", type: :model do
  describe "バリデーションのテスト" do
    it "ユーザーネーム、メール、パスワードがあれば有効" do
      user = build(:user)
      expect(user).to be_valid
    end
    context "name" do
      it "空欄なら無効" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "20文字以上の場合無効" do
        user = build(:user, name: "abcdefghijklmnopqrstuv")
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "email" do
      it "空欄なら無効" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context "password" do
      it "空欄なら無効" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
    end
  end
end
