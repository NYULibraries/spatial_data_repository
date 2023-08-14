# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'
require 'devise'
require 'factory_bot'
require 'rspec/rails'
require 'selenium-webdriver'
require 'simplecov'
require 'view_component/test_helpers'
require 'view_component/system_test_helpers'

SimpleCov.start do
  add_filter 'spec'
end

# Capybara.register_driver :firefox_headless do |app|
#   options = ::Selenium::WebDriver::Firefox::Options.new
#   options.args << '--headless'
#
#   Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
# end
#
# Capybara.javascript_driver = :selenium_chrome_headless
# Capybara.current_driver = Capybara.javascript_driver
# Capybara.default_driver = Capybara.javascript_driver

Capybara.server = :puma
Capybara.default_max_wait_time = 15

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

# require_relative 'support/controller_macros'

ActiveJob::Base.queue_adapter = :inline

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = Rails.root.join('spec/fixtures').to_s

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Turn on "test mode" for OmniAuth
  OmniAuth.config.test_mode = true

  config.before(:suite) do
    DatabaseCleaner.start
  ensure
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers, type: :feature
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!

  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
