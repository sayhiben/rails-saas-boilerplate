# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin', '~> 1.0.0.pre5'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'devise'
gem 'flipper'
gem 'flipper-active_record'
gem 'flipper-ui'
gem 'font-awesome-rails'
gem 'haml'
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'marginalia'
gem 'money'
gem 'paper_trail'
gem 'payola-payments'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'pundit'
gem 'rails', '~> 5.0.1'
gem 'redis', '~> 3.0'
gem 'rolify'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'uglifier', '>= 1.3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'stripe-ruby-mock'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'brakeman'
  gem 'listen', '~> 3.0.5'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
