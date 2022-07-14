class GoogleSearchPage
  include PageObject

  text_field(:search_box, name: "q")
  button(:search, name: "btnK")
  
  def visit
    navigate_to 'https://www.google.com'
    sleep 2
  end

  def type_in_search(text)
    self.search_box = text
    sleep 2
  end

  def click_search
    self.search
    sleep 2
    
  end

end



 