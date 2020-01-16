# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'devise'
require 'factory_bot'

Capybara.register_driver :firefox_headless do |app|
  options = ::Selenium::WebDriver::Firefox::Options.new
  options.args << '--headless'
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.javascript_driver = :firefox_headless
Capybara.current_driver = Capybara.javascript_driver
Capybara.server = :puma
Capybara.default_max_wait_time = 15

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |file| require file }

#require_relative 'support/controller_macros'

ActiveJob::Base.queue_adapter = :inline

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Turn on "test mode" for OmniAuth
  OmniAuth.config.test_mode = true

  config.before(:suite) do
    begin
      DatabaseCleaner.start
    ensure
      DatabaseCleaner.clean
    end
  end

  config.include Capybara::DSL
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers, type: :feature
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!
end