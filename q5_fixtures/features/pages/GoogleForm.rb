class GoogleForm
  include PageObject
  include DataMagic

  text_field(:name, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_field(:city, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_field(:phone, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[3]/div/div/div[2]/div/div[1]/div/div[1]/input')
  div(:ruby, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[4]/div/div/div[2]/div[1]/div[1]')
  div(:web_automation, xpath: '//*[@id="i21"]/div[2]')
  div(:qa, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[5]/div/div/div[2]/div[1]/div/span/div/div[1]')
  div(:developer, xpath:'//*[@id="mG61Hd"]/div[2]/div/div[2]/div[5]/div/div/div[2]/div[1]/div/span/div/div[2]/label/div')
  div(:receptionist, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[5]/div/div/div[2]/div[1]/div/span/div/div[3]')
  span(:submit, xpath: '//*[@id="mG61Hd"]/div[2]/div/div[3]/div[1]/div[1]/div/span')

  def visit
    navigate_to 'https://docs.google.com/forms/d/e/1FAIpQLSfP9aqsApSmsoUSc0WpWNbfEHUilQV6rcQ4CvI2PIUZSDKPhQ/viewform'
  end

  def populate_page(detail_no)
    data = data_for "form_data/#{detail_no}"
    populate_page_with data

    data['skills'].split(', ').each do |skill|
      if(skill =~ /WEB AUTOMATION/i)
        web_automation_element.click
      elsif(skill =~ /RUBY/i)
        ruby_element.click   
      end  
    end

    case data['role']
    when /QA/i
      qa_element.click
    when /Developer/i
      developer_element.click
    when /Receptionist/i
      receptionist_element.click
    end

    sleep 5
  end

  def submit_form
    submit_element.click
  end

end

  