require 'rails_helper'

RSpec.describe Document, type: :system do

  def login
    visit new_user_session_path
    fill_in 'user[name]', with: 'mitsue'
    fill_in 'user[email]', with: 'mistue@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'commit'
  end

  describe 'ドキュメントの投稿' do
    context 'ドキュメントが正常にアップロードされた場合' do
      it 'ドキュメントが表示されること' do
        login
        click_on 'AIモデル一覧'
        click_button('search_btn_1')
        click_on '新しく文字認識を試す'
        fill_in 'document[title]', with: 'タイトル'
        fill_in 'document[description]', with: 'タイトルの説明'
        # attach_file 'ファイル', Rails.root.join('spec/fixtures/test.pdf')
        click_on '保存'
        visit document_path(Document.first.id)
        expect(page).to have_content document[:title]
        expect(page).to have_content document[:description]
      end
    end
  end
end