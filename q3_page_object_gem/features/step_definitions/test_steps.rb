require_relative "../pages/google_search_page.rb"

Given('I am on google page') do
  @search_page = GoogleSearchPage.new(@driver)
  @search_page.visit
end

When('I search youtube in search bar') do
  @search_page.type_in_search('youtube')
  @search_page.click_search
end

Then('show search results on new page') do
  puts "redirecting to search results"
end

# Given('I am on search result page') do
#   puts object.show_current_url
# end

# When('I click first search result') do
#   google_first_item = object.get_element(:tag_name, 'h3')
#   object.perform_click(google_first_item)
# end

# Then('Redirect to youtube.com') do
#   puts "opening youtube"
# end

# Given('I am on youtube.com') do
#   puts object.show_current_url
# end

# When('I search selenium in search bar') do
#   youtube_search = object.get_element(:name, 'search_query')
#   object.send_key_to_element(youtube_search, 'selenium')
#   object.send_key_to_element(youtube_search, :enter)
# end

# Then('Redirect to video seaches for selenium') do
#   puts object.show_current_url
# end