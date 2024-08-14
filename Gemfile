source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'blacklight', '~> 7.0'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 4.0'
gem 'capistrano', '~> 3.17'
gem 'capistrano-passenger', '~> 0.2.1'
gem 'capistrano-rails', '~> 1.6'
gem 'capistrano-rbenv', '~> 2.2'
gem 'config'
gem 'dalli'
gem 'devise'
gem 'geoblacklight', '~> 4.4.0'
# Override geo_combine version defined by geoblacklight gem
gem 'geo_combine', github: 'OpenGeoMetadata/GeoCombine', ref: 'bd6a122c569636355f9fa64a9a62df7cbb7482ab'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'mysql2'
gem 'newrelic_rpm'
gem 'omniauth', '1.9.2'
gem 'omniauth-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'puma', '~> 5.0'
gem 'rack-attack'
gem 'rails', '~> 7.0.6'
gem 'rsolr', '>= 1.0', '< 3'
gem 'sassc-rails', '~> 2.1'
gem 'sdoc', group: :doc
gem 'sdr_cli', github: 'NYULibraries/sdr-cli', branch: 'upgrade-to-geocombine-0.9.2'
gem 'sprockets', '< 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'twitter-typeahead-rails', '0.11.1.pre.corejavascript'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component', '~> 2.83.0'
gem 'vite_rails', '~> 3.0'
gem 'whenever', require: false

group :test do
  gem 'whenever-test'
end

group :development, :test do
  gem 'axe-core-rspec'
  gem 'bundler-audit'
  gem 'byebug'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'geckodriver-helper'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'solr_wrapper'
  gem 'spring'
  gem 'sqlite3'
  gem 'timecop'
end
