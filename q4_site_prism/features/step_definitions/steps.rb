require_relative "../pages/CricbuzzHome.rb"

Given('I am on Cricbuzz site') do
  @cricbuzz = CricbuzzHome.new
  @cricbuzz.load
  sleep 5
end

When('I click More option from taskbar') do
  @cricbuzz.click_more
  
end

When('Click contact us from dropdown') do
  @cricbuzz.click_contact_us
end

When('Fill details in form') do
  @cricbuzz.fill_form
end

When('Click submit button') do
  @cricbuzz.submit_form
end

Then('form submitted successfuly') do
  expect(@cricbuzz.confirm_submit).to eq('Thank you for contacting us.')
end