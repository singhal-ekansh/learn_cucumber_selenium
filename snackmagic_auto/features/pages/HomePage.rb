class HomePage
  include PageObject
  include DataMagic

  button(:login_btn, xpath: '//*[@id="root"]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[2]/button')
  link(:start_order_home, xpath:  '//*[@id="root"]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[1]/div/a[2]')
  link(:start_order_new, xpath:  '//*[@id="root"]/div/div[2]/div/div/div/div/div[2]/div/div/div/div[2]/div/a')
  

  def load_url
    navigate_to 'https://admin:admin@automation-frontend.snackmagic.com/'
    sleep 10
  end

  def login_click
    login_btn_element.click
    sleep 5
  end

  def start_new_order
    start_order_home_element.click
    sleep 5
    start_order_new_element.click
    sleep 8
  end
end