source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'carrierwave'
gem 'devise'
gem 'devise-bootstrap5'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'mailjet'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rails-i18n'
gem 'resque'
gem 'rmagick'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.3'
  gem 'pg'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'sqlite3', '~> 1.4'
  gem 'web-console', '>= 4.1.0'

  gem 'capistrano',           require: false
  gem 'capistrano-bundler',   require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails',     require: false
  gem 'capistrano-rbenv',     require: false
  gem 'capistrano-resque',    require: false
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
