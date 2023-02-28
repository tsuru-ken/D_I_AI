source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.6'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

# gem 'redis', '~> 4.0'

# gem 'bcrypt', '~> 3.1.7'

# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capistrano', '3.16.0' # capistranoのツール一式
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'spring'
  
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
end

group :development do
  gem 'letter_opener_web'
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
 

  # デバック関連
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 画像保存用
gem 'carrierwave'

# OCR関連
gem 'google-cloud-vision'
gem 'dotenv-rails'
gem 'rtesseract'
gem 'fog-aws'

# ログイン関連
gem 'devise'
gem 'rexml'
gem 'devise-i18n'
gem 'rails_admin', '~> 3.0'
gem 'cancancan'

# 検索機能
gem 'ransack'

# URLリンク機能
gem 'rinku'

gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
gem 'unicorn'
gem 'aws-sdk'
gem 'concurrent-ruby', '~> 1.1.9'