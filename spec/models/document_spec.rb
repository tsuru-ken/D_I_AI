require 'rails_helper'

RSpec.describe "ドキュメントののモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    include CarrierWave::Test::Matchers
    let(:user) { User.create(name: "example user", email: "user@example.com", password: "password") }

    context 'ドキュメント情報が正しく入力される' do
      it 'バリデーションが通る' do
        document = Document.new(title:'タイトル',description:'説明', user: user)
        document.document_image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/OCR_sample_image/sample1.png'))
        expect(document).to be_valid
      end
    end
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        document = Document.new(title:'',description:'説明', user: user)
        document.document_image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/OCR_sample_image/sample1.png'))
        expect(document).not_to be_valid
      end
    end
    context '画像が空の場合' do
      it 'バリデーションに引っかかる' do
        document = Document.new(title:'タイトル',description:'説明',document_image:'', user: user)
        expect(document).not_to be_valid
      end
    end
  end
end



