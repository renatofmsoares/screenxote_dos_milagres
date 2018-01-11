require 'selenium-webdriver'
require 'capybara'
require 'capybara/rspec'

Capybara.configure do |c|
  c.default_driver = :selenium
  c.app_host = 'http://mark7.herokuapp.com'
end

Capybara.default_max_wait_time = 10
