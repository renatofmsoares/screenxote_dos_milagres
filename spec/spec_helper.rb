require 'selenium-webdriver'
require 'capybara'
require 'capybara/rspec'
require 'allure-rspec'
require 'logger'

Capybara.configure do |c|
  c.default_driver = :selenium
  c.app_host = 'http://mark7.herokuapp.com'
end

Capybara.default_max_wait_time = 10

AllureRSpec.configure do |c|
  c.output_dir = 'log/reports' # => where will be genereted the XML reports
  c.clean_dir = true # => 'true' to not generate execution history
  c.loogin_level = Logger::WARN # => log level
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include AllureRSpec::Adaptor # => Allure Adaptor
  config.inclide Capybara::DSL
end
