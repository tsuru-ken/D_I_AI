require_relative "boot"
require 'dotenv/load'
require "rails/all"

Bundler.require(*Rails.groups)

module DIAI
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.default_locale = :ja

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/config/initializers)

    ENV['PATH'] = "#{ENV['PATH']}:/home/app/tesseract/bin:/usr/bin"

    config.generators do |g|
      g.test_framework :rspec,
                       model_specs: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
    end
  end
end