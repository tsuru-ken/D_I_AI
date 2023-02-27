require 'rails_helper'

RSpec.describe Document, type: :system do

  

  describe 'ドキュメントの投稿機能' do
    let(:user) { FactoryBot.create(:third_user)}
    def login
      visit new_user_session_path
      fill_in 'user[name]', with: 'アドミンつるけん'
      fill_in 'user[email]', with: 'admin@admin.com'
      fill_in 'user[password]', with: '123456'
      click_on 'commit'
      sleep(5)
    end
    context 'ドキュメントが正常にアップロードされた場合' do
      it 'AIを試す画面に移動できる' do
        login 
        click_on 'AIモデル一覧'
        click_button('search_btn_1')
        click_on '新しく文字認識を試す'
        fill_in 'document[title]', with: 'タイトル'
        fill_in 'document[description]', with: 'タイトルの説明'
        attach_file('document[document_image]', Rails.root.join('app/assets/images/OCR_sample_image/sample1.png'))
        click_on '保存'
        document = Document.last
        visit document_path(document.id)
        expect(page).to have_content document.title
        expect(page).to have_content document.description
        expect(page).to have_content document.document_image.filename.to_s
      end
    end
    context 'ドキュメントのタイトルが入力されてない場合' do
      it '画像の投稿ができず、新規作成画面に戻る' do
        login
        click_on 'AIモデル一覧'
        click_button('search_btn_1')
        click_on '新しく文字認識を試す'
        title { '' }
        fill_in 'document[description]', with: 'タイトルの説明'
        attach_file('document[document_image]', Rails.root.join('app/assets/images/OCR_sample_image/sample1.png'))
        click_on '保存'
        document = Document.last
        visit document_path(document.id)
        expect(page).not_to have_content '新規作成画面'
        expect(page).to have_content document.description
        expect(page).to have_content document.document_image.filename.to_s
      end
    end
    context 'ドキュメントの画像が選択されてない場合' do
      it '画像の投稿ができず、新規作成画面に戻る' do
        login
        click_on 'AIモデル一覧'
        click_button('search_btn_1')
        click_on '新しく文字認識を試す'
        fill_in 'document[title]', with: 'タイトル'
        fill_in 'document[description]', with: 'タイトルの説明'
        attach_file('document[document_image]', Rails.root.join('app/assets/images/OCR_sample_image/sample1.png'))
        click_on '保存'
        document = Document.last
        visit document_path(document.id)
        expect(page).to have_content document.title
        expect(page).to have_content document.description
        expect(page).not_to have_content '新規作成画面'
      end
    end
  end
end



