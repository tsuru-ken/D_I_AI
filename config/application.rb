require_relative "boot"
require 'dotenv/load'
require "rails/all"

Bundler.require(*Rails.groups)

module DIAI
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = :ja

    config.before_initialize do
      s3_endpoint = 'https://s3-ap-northeast-1.amazonaws.com'
      Aws.config.update({
        region: 'ap-northeast-1',
        credentials: Aws::Credentials.new('ACCESS_KEY_ID', 'SECRET_ACCESS_KEY'),
        s3: { endpoint: s3_endpoint }
      })
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/config/initializers)
  end
end
