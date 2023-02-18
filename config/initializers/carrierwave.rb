# CarrierWave.configure do |config|
#   config.storage = :file
#   config.asset_host = ActionController::Base.asset_host
# end


require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'diai-development' # 作成したバケット名を記述
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAWJ4M6EMMEBBKUFEP'], # 環境変数
      aws_secret_access_key: ENV['XfGLwGDBv7j1cgw2ewHbSepda3FAYoshhiGph7Z+'], # 環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }

    config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = '本番環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai-development'
    when 'development'
      config.fog_directory = '開発環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai-development'
    when 'test'
      config.fog_directory = 'テスト環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai-development'
  end
end