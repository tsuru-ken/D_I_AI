# CarrierWave.configure do |config|
#   config.storage = :file
#   config.asset_host = ActionController::Base.asset_host
# end



CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory = 'test-s3-tsuruken'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1',
    path_style: true
      # provider:              'AWS',
      # aws_access_key_id:     ENV["AKIAWJ4M6EMMHXKN2F7G"],
      # aws_secret_access_key: ENV["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"],
      # region:                'ap-northeast-1',
      # path_style:            true,
  }

  config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
end
#   case Rails.env
#     when 'production'
#       config.fog_directory = '本番環境用のバケット名'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai'
#     when 'development'
#       config.fog_directory = '開発環境用のバケット名'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai'
#     when 'test'
#       config.fog_directory = 'テスト環境用のバケット名'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/diai'
#   end
# end