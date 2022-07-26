require 'rubygems'
require 'selenium-webdriver'
require 'page-object'
require 'site_prism'
require 'capybara'
require 'capybara/cucumber'


DataMagic.yml_directory = 'features/data'
DataMagic.load 'user_orders.yml'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
end