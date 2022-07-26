class LoginPage
  include PageObject
  include DataMagic

  text_field(:username, xpath: '//*[@id="form-login"]/div[1]/input')
  text_field(:password, xpath:  '//*[@id="password-login"]')
  button(:login_submit, xpath:  '//*[@id="form-login"]/div[3]/div/button')

  def login(order_number)
    order_details = data_for "user_orders/#{order_number}"
    populate_page_with order_details
    login_submit_element.click
    sleep 10
  end
end

