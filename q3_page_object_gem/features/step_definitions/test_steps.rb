require_relative "../pages/google_search_page.rb"
require_relative "../pages/google_results_page.rb"

Given('I am on google page') do
  Browser = Selenium::WebDriver.for :chrome
  @search_page = GoogleSearchPage.new(Browser)
  @search_page.visit
  
end

When('I search youtube in search bar') do
  @search_page.type_in_search('youtube')
  @search_page.click_search
end

Then('show search results on new page') do
  puts "redirecting to search results"
  
end

Given('I am on search result page') do
  puts
end

When('I click first search result') do
  @google_search_result_page = GoogleSearchResult.new(Browser)
  @google_search_result_page.click_first_item
end

Then('Redirect to youtube.com') do
  puts "opening youtube"
end