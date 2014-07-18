source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping the application
# running in the background.
gem 'spring',        group: :development
# User authentication
gem 'devise'
# Parsing plain-English dates pulled from the scraper
gem 'chronic'
# Scrape web pages
gem 'nokogiri'
gem 'restclient'
# Allow for scraping to be done as a background job
gem 'sidekiq'
gem 'redis'
# Sidekiq jobs are automatically run
gem 'sidetiq', '~> 0.4.3'
# For Sidekiq monitor
gem 'sinatra', '>= 1.3.0', require: nil

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'pry-rails'
end

group :test do
  gem 'coveralls', require: false
  gem 'launchy'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'unicorn-rails'
  gem 'foreman'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
