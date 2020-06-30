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

# 追加gem------------------------------------------------------
# ログイン機能
gem 'devise'
# レイアウト
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

gem 'jquery-ui-rails'

gem 'refile', require: "refile/rails", github: 'manfe/refile'
gem 'refile-mini_magick'

# 緯度、経度割り出し
gem 'geocoder'
# 環境変数化
gem 'dotenv-rails'
# 多言語化
gem 'rails-i18n'
# ページング
gem 'kaminari'
#ダミーデータ作成
gem 'faker'

# summernote
gem 'summernote-rails', '~> 0.8.10.0'
gem 'simple_form'

gem 'carrierwave'


#--------------------------------------------------------------



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
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
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :production do
  gem 'mysql2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
