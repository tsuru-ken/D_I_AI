require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  let(:factory) { FactoryBot.create(:factory) }
  let(:factory) { FactoryBot.create(:factory_2) }
  let(:factory) { FactoryBot.create(:factory_3) }
  describe 'ログイン機能' do
    context 'ユーザー新規登録' do
      it '新規登録するとマイページに遷移する' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'テスト'
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        click_on 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end
end