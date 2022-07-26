require_relative "../pages/HomePage.rb"
require_relative "../pages/LoginPage.rb"

Browser = Selenium::WebDriver.for :chrome
Browser.manage.window.maximize
Given('I am on snackmagic site') do
  @homepage = HomePage.new(Browser)
  @homepage.load_url
  sleep 10
end

When('I login with credentials for {string}') do |order_number|
  @homepage.login_click
  @loginpage = LoginPage.new(Browser)
  @loginpage.login(order_number)
end

When('I start a new order') do
  @homepage.start_new_order
end

When('I fill all required details for {string}') do |order_number|
  @order_page = OrderPage.new(Browser)
  @order_page.fill_details(order_number)
end

Then('Order placed successfuly') do
end

