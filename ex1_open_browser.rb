require 'rubygems'
require 'selenium-webdriver'

class Automation
  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def navigate_to(url)
    @driver.navigate.to url
    sleep 1
  end

  def get_element(type, name)
    element = @driver.find_element(type, name)
    sleep 1
    element
  end
  
  def send_key_to_element(element, key)
    element.send_keys key
    sleep 1
  end

  def perform_click(element)
    element.click
    sleep 1
  end

  def start_test
    navigate_to('https://www.google.co.in/')

    # search youtube in google search
    google_search = get_element(:name, 'q')
    send_key_to_element(google_search, 'youtube')
    send_key_to_element(google_search, :enter)

    # click on first item from search
    google_first_item = get_element(:tag_name, 'h3')
    perform_click(google_first_item)

    # search in youtube search
    youtube_search = get_element(:name, 'search_query')
    send_key_to_element(youtube_search, 'selenium')
    send_key_to_element(youtube_search, :enter)
  end
end

Automation.new.start_test