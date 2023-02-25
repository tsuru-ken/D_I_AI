describe "ユーザーモデル機能", type: :model do
  describe "バリデーションのテスト" do
    it "ユーザー名が未入力だとバリデーションがかかる" do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
      # ...
    end

    it "アドレスが未入力だとバリデーションがかかる" do
      # ...
    end

    it "パスワードが未入力だとバリデーションがかかる" do
      # ...
    end

    it "ユーザー名が50文字以内の場合は有効であること" do
      # ...
    end
  end
end


