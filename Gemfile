source 'https://rubygems.org'


gem 'blacklight'
gem 'geoblacklight', '~> 1.9.0'
#gem 'geoblacklight', '~> 1.4.0'


gem 'twitter-typeahead-rails', '0.11.1.pre.corejavascript'

# Range limit gem for slider on Solr integer fields (year)
# Currently broken (9/2/2016)
# gem 'blacklight_range_limit'

# Figs for var management
gem 'figs'

# Loads NYU Libaries omniauth strategy
gem 'omniauth-nyulibraries', git: 'https://github.com/NYULibraries/omniauth-nyulibraries', tag: 'v2.1.2'
gem 'devise', '>= 3.4.1'

gem 'rsolr'
gem 'solr_wrapper', '~> 2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'web-console'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'spring'
  gem 'sqlite3'
end

group :production do
  # MySQL for Rails backend dbter
  gem 'mysql2', '~> 0.3.20'
end
