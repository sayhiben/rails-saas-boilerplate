# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin', github: 'activeadmin'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'devise'
gem 'haml'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'money'
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
  gem 'dotenv-rails'
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
