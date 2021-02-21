source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

gem 'rails', '~> 5.2.3'
gem 'sqlite3', '~> 1.3.6'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

# ログイン機能
gem 'devise'
#SNS認証(google, twitter)
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
# レイアウトなど
gem 'bootstrap', '~> 4.5.3'
gem 'jquery-rails'
# font-awesome
gem 'font-awesome-sass'

gem 'jquery-ui-rails'
# refile + S3
gem 'refile', require: "refile/rails", github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'refile-s3'

# 緯度、経度割り出し,位置情報検索
gem 'geocoder'
gem 'geokit-rails'
# 環境変数管理
gem 'dotenv-rails'
# 多言語化
gem 'rails-i18n'
# ページング
gem 'kaminari'
# ダミーデータなど作成
gem 'faker'

# summernote（エディタ）
gem 'summernote-rails', '~> 0.8.10.0'
gem 'simple_form'
# グラフ描画
gem 'chartkick'
gem 'groupdate'
# carrierwave + S3
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
# javascript 変数受け渡し
gem 'gon'
# デバッグ
gem 'pry-byebug'
# 500エラーslack通知用
gem 'exception_notification', github: 'smartinez87/exception_notification'
gem 'slack-notifier'

#APIモード用 JSONデータ作成
gem 'jbuilder', '~> 2.5'



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # テスト
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  # capistrano,自動デプロイ
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-rbenv'
end

group :development do
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'mysql2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
