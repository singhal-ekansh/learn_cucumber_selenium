
Browser = Selenium::WebDriver.for :chrome

Given('I am on google form') do
  @google_form = GoogleForm.new(Browser)
  @google_form.visit
  sleep 2
end

Then("fill the form for {string}") do |detail_no|
  @google_form.populate_page(detail_no)
  @google_form.submit_form
  sleep 5
end

Then('Response submitted successfully') do
  puts "submitted"
end