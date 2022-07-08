require 'rubygems'
require 'selenium-webdriver'

class Automation
  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def navigate_to(url)
    @driver.navigate.to url
    sleep 2
  end

  def get_element(type, name)
    element = @driver.find_element(type, name)
    sleep 2
    element
  end
  
  def send_key_to_element(element, key)
    element.send_keys key
    sleep 2
  end

  def perform_click(element)
    element.click
    sleep 2
  end

  def show_current_url
    @driver.current_url
  end
end

object = Automation.new

Given('I am on google page') do
  object.navigate_to('https://www.google.co.in/')
end

When('I search youtube in search bar') do
  google_search = object.get_element(:name, 'q')
  object.send_key_to_element(google_search, 'youtube')
  object.send_key_to_element(google_search, :enter)
end

Then('show search results on new page') do
  puts "redirecting to search results"
end

Given('I am on search result page') do
  puts object.show_current_url
end

When('I click first search result') do
  google_first_item = object.get_element(:tag_name, 'h3')
  object.perform_click(google_first_item)
end

Then('Redirect to youtube.com') do
  puts "opening youtube"
end

Given('I am on youtube.com') do
  puts object.show_current_url
end

When('I search selenium in search bar') do
  youtube_search = object.get_element(:name, 'search_query')
  object.send_key_to_element(youtube_search, 'selenium')
  object.send_key_to_element(youtube_search, :enter)
end

Then('Redirect to video seaches for selenium') do
  puts object.show_current_url
end