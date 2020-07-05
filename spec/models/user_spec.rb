require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    it　"ユーザーネーム、メール、パスワードがあれば有効" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空だと無効" do
      user = build(:user, name: "")
      expect(user.errors[:name]).to include("を入力して下さい")
    end
  end
end
