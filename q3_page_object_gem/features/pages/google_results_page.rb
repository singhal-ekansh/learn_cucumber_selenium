class GoogleSearchResult
  include PageObject

  a(:search_item,:xpath => "//*[@id='rso']/div[1]/div/div/div/div/div/div/div[1]/a")
  def click_first_item
    search_item
  end

end


 