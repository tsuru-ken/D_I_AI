CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = ActionController::Base.asset_host
end


# 開発用
CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'test-s3-tsuruken'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
      path_style: true
    }
  end
end

# 本番用
#   config.storage :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#       region:                'ap-northeast-1',
#       path_style:            true,
#   }

#   config.fog_public     = false
#   config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

#   case Rails.env
#     when 'production'
#       config.fog_directory = 'diai-production'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/本番環境用のバケット名'
#     when 'development'
#       config.fog_directory = 'diai-development'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/開発環境用のバケット名'
#     when 'test'
#       config.fog_directory = 'テスト環境用のバケット名'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/テスト環境用のバケット名'
#   end
# end