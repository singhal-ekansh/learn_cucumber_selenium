class GoogleSearchPage
  include PageObject

  def visit
    navigate_to 'https://www.google.com'
    sleep 2
  end

  def type_in_search(text)
    @search_bar = @driver.find_element(:name, 'q')
    @search_bar.send_keys text
    sleep 2
  end

  def click_search
    @search_bar.send_keys :enter
    sleep 2
  end

end



 