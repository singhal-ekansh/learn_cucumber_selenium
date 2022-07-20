require 'rubygems'
require 'selenium-webdriver'
require 'page-object'

DataMagic.yml_directory = 'features/data'
DataMagic.load 'form_data.yml'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
end