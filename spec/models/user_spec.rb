require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能' do
    context 'ユーザー名が未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        user = User.new(name:'',email:'abc@abc.com',password:'123456', password_confirmation:'123456')
        expect(user).not_to be_valid
      end
    end
    context 'アドレスが未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        user = User.new(name:'takeshi',email:'',password:'123456', password_confirmation:'123456')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        user = User.new(name:'takeshi',email:'abc123@dic.com',password:'', password_confirmation:'')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザー情報が正しく入力される' do
      it 'バリデーションが通る' do
        user = User.new(name:'takeshi',email:'abc123@dic.com',password:'123456', password_confirmation:'123456')
        expect(user).to be_valid
      end
    end
  end
end

