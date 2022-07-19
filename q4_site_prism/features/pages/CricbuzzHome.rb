require_relative "../pages/contact_form_section.rb"

class CricbuzzHome < SitePrism::Page

  set_url 'https://www.cricbuzz.com/'

  element :more_drop_down, :xpath, '//*[@id="cb-main-menu"]/div[6]'
  element :contact_us, :xpath, '//*[@id="cb-main-menu"]/div[6]/nav/a[7]'
  section :form_fill_section, ContactUsForm, "#page-wrapper > div.cb-bg-white.cb-col-100.cb-col > div.cb-col-67.cb-col.cb-left.cb-hm-rght"
  element :success_text, :xpath, '//*[@id="success_form"]'

  def click_more
    more_drop_down.click
    sleep 2
  end

  def click_contact_us
    contact_us.click
    sleep 5
  end

  def fill_form
    form_fill_section.populate_fields(
      name: 'ekansh singhal',
      email: 'ekansin07@gmail.com',
      subject: 'query about VK',
      message: 'When will VK hit century. Or will he retire at 70 centuries.'
    )
    # Click on captcha yourself
    sleep 15
  end

  def submit_form
    form_fill_section.click_submit
  end

  def confirm_submit
    success_text.text
  end

end
