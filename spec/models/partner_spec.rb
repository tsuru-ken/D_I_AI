require 'rails_helper'
RSpec.describe "パートナー（会社情報）モデル機能", type: :model do
  describe 'バリデーションのテスト' do
    include CarrierWave::Test::Matchers
    let(:user) { User.create(name: "example user", email: "user@example.com", password: "password") }

    context 'パートナー（会社情報）情報が正しく入力される' do
      it 'バリデーションが通る' do
        partner = Partner.new(
          name:'会社名',
          address:'所在地',
          url:'会社URL',
          established:'会社設立年',
          service:'サービス概要',
          engineer:'技術者数',
          provision:'クラウド',
          user: user)
        partner.product_infos.build(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/DIC_blog.png')))
        expect(partner).to be_valid
      end
    end
    context '会社名が空の場合' do
      it 'バリデーションに引っかかる' do
        partner = Partner.new(
          name:'',
          address:'所在地',
          url:'会社URL',
          established:'会社設立年',
          service:'サービス概要',
          engineer:'技術者数',
          provision:'クラウド',
          user: user)
        partner.product_infos.build(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/DIC_blog.png')))
        expect(partner).not_to be_valid
      end
    end
    context '所在地が空の場合' do
      it 'バリデーションに引っかかる' do
        partner = Partner.new(
          name:'会社名',
          address:'',
          url:'会社URL',
          established:'会社設立年',
          service:'サービス概要',
          engineer:'技術者数',
          provision:'クラウド',
          user: user)
        partner.product_infos.build(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/DIC_blog.png')))
        expect(partner).not_to be_valid
      end
    end
    context '会社URLが空の場合' do
      it 'バリデーションに引っかかる' do
        partner = Partner.new(
          name:'会社名',
          address:'所在地',
          url:'',
          established:'会社設立年',
          service:'サービス概要',
          engineer:'技術者数',
          provision:'クラウド',
          user: user)
        partner.product_infos.build(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/DIC_blog.png')))
        expect(partner).not_to be_valid
      end
    end
    context '会社設立年が空の場合' do
      it 'バリデーションに引っかかる' do
        partner = Partner.new(
          name:'会社名',
          address:'所在地',
          url:'会社URL',
          established:'',
          service:'サービス概要',
          engineer:'技術者数',
          provision:'クラウド',
          user: user)
        partner.product_infos.build(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/DIC_blog.png')))
        expect(partner).not_to be_valid
      end
    end
  end
end
