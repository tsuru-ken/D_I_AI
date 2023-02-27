require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  let(:factory) { FactoryBot.create(:factory) }
  let(:factory) { FactoryBot.create(:factory_2) }
  let(:factory) { FactoryBot.create(:factory_3) }
  describe 'ログイン機能' do
    context 'ユーザー新規登録' do
      it '新規登録するとマイページに遷移する' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'mitsue'
        fill_in 'user[email]', with: 'mitsue@example.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        click_on 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context '正しいパスワードが入力された場合' do
      it 'ログインできること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'takayuki@example.com'
        fill_in 'user[password]', with: 'password'
        click_on 'commit'
        #binding.pry
        expect(page).not_to have_content 'takayuki'
        expect(page).to have_content '違います'
      end
    end

    context '誤ったパスワードが入力された場合' do
      it 'ログインできないこと' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'takayuki@example.com'
        fill_in 'user[password]', with: 'pass'
        click_on 'commit'
        expect(page).not_to have_content 'takayuki'
        expect(page).to have_content '違います'
      end
    end
    context '管理者権限を持ったユーザーログインした場合' do
      it '管理者画面のリンクが出て管理者画面に行く' do
        user ||= FactoryBot.create(:third_user, email: "takayuki@example.com")
        visit new_user_session_path
        fill_in 'user[name]', with: 'mitsue'
        fill_in 'user[email]', with: 'takayuki@example.com'
        fill_in 'user[password]', with: 'password'
        click_on 'commit'
        expect(page).to have_content '管理画面'
      end
    end

    context 'ログアウトテスト' do
      it 'ユーザーがログアウトする' do
        user ||= FactoryBot.create(:third_user, email: "takayuki@example.com")
        visit new_user_session_path
        fill_in 'user[name]', with: 'mitsue'
        fill_in 'user[email]', with: 'takayuki@example.com'
        fill_in 'user[password]', with: 'password'
        click_on 'commit'
        sleep (1)
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end
end