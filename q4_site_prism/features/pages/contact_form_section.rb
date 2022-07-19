class ContactUsForm < SitePrism::Section
  element :name , '[name="uName"]'
  element :email , '[name="uEmail"]'
  element :subject , '[name="uSubject"]'
  element :message , '[name="uMessage"]'
  element :submit, 'button[type="submit"]'

  def populate_fields(**attrs)
    name.set attrs[:name]
    email.set attrs[:email]
    subject.set attrs[:subject]
    message.set attrs[:message]
  end

  def click_submit
    submit.click
    sleep 10
  end

end