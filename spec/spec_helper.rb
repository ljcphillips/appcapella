ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'byebug'
require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rack/test'
require 'rspec'
require 'selenium/webdriver'
require 'pry'
require 'webdrivers'

require_relative './features/web_helpers'

Capybara.app = Appcapella

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => { args: %w(--use-fake-device-for-media-stream --use-fake-ui-for-media-stream start-maximized disable-infobars --disable-extensions --disable-dev-shm-usage --no-sandbox) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => { args: %w(--headless --use-fake-device-for-media-stream --use-fake-ui-for-media-stream) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

Capybara.default_max_wait_time = 1000
