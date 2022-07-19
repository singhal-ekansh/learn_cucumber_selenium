require 'site_prism'
require 'rubygems'
require 'selenium-webdriver'
require 'page-object'
require 'capybara'
require 'capybara/cucumber'

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser)
end

Capybara.ignore_hidden_elements = false

# Then tell Capybara to use the Driver you've just defined as its default driver
Capybara.configure do |config|
  config.default_driver = :site_prism
end