class OrderPage
  include PageObject
  include DataMagic

  text_field(:treat_name, id: 'treatName')
  text_field(:sender_name, id: 'senderName')

  span(:treat_for_teams, xpath: '//*[@id="send-a-treat"]/div[2]/div[2]/div[1]/div/label/div/div/span')
  div(:snacks, xpath: '//*[@id="send-a-treat"]/div[3]/div[2]/div[1]/div/label/div[1]')
  div(:swags, xpath: '//*[@id="send-a-treat"]/div[3]/div[2]/div[2]/div/label/div[1]/div[1]/div[1]')
  div(:snacks_swags, xpath: '//*[@id="send-a-treat"]/div[3]/div[2]/div[3]/div/label/div[1]')
  button(:create_order_btn, xpath: '//*[@id="root"]/div/div[2]/div/div/div/div/div[2]/div/div/div/div[2]/div/button')

  div(:build_own, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[3]/div[1]/div')
  link(:save_continue , xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[3]/div/div[2]/a')
  
  div(:doller45, xpath: '//*[@id="budget-section"]/div[3]/div[1]/div/div/label/div')
  div(:doller60, xpath: '//*[@id="budget-section"]/div[3]/div[2]/div/div[2]/label/div')
  div(:doller99, xpath: '//*[@id="budget-section"]/div[3]/div[3]/div/div/label/div')
  text_field(:custom_budget, id: 'treatBudgetCustom')

  div(:restrict_link, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[1]/div/div')
  div(:allow_anyone, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div')

  text_field(:total_recipient, id: 'expectedCount')
  text_field(:non_us_recipient, id: 'internationalCount')

  div(:not_collect_address, xpath: '//*[@id="recipient-information-modal-form"]/div/div/div[2]/div/div')
  div(:collect_address, xpath: '//*[@id="recipient-information-modal-form"]/div/div/div[1]/div/div')

  button(:save, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[3]/div/div[2]/button')

  div(:standard_ship, xpath: '//*[@id="shipping-modal-form"]/div/div[1]/div/div/label/div/div[1]')
  div(:no_customize, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[9]/div')
  link(:custom_next, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[3]/div/div/a')

  button(:proceed_to_check, xpath: '//*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[2]/button')
  div(:card, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[1]/div/div[1]/div[2]/div/div[5]/div[3]')
  link(:card_next, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[2]/a')
  div(:snack_wallet, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[1]/div/div[1]/div[2]/div[3]/div[1]')
  link(:place, xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[2]/a')
  div(:no_invite,xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div/div[3]/div/div/div[3]/div')
  link(:confirm,xpath: '//*[@id="modal-root"]/div/div/div/div[1]/div/div[3]/div/div[2]/a')

  def fill_details(order_number)
    @order_details = data_for "user_orders/#{order_number}"

    create_new_treat()
    click_box_type()
    click_budget()
    set_link_restrictions()
    number_of_recipients()
    collect_email_or_not()
    link_expiration()
    shipping_type()
    message_send()
    customization()
    checkout()
  end

  def create_new_treat
    populate_page_with @order_details

    case @order_details['treat_for']
    when /teams/i
      treat_for_teams_element.click
    end

    case @order_details['treat_type']
    when /snacks/i
      snacks_element.click
    end

    sleep 2
    create_order_btn_element.click
    sleep 5


  end

  def click_box_type

    case @order_details['box_type']
    when /build_their_own/
      build_own_element.click
    end

    sleep 2
    save_continue_element.click
    sleep 5
  end

  def click_budget
    case @order_details['budget']
    when /45/
      doller45_element.click
    when /60/
      doller60_element.click
    when /99/
      doller99_element.click
    end

    save_continue_element.click
    sleep 5
  end

  def set_link_restrictions
    case @order_details['link_restrict']
    when /specific/i
      restrict_link_element.click
    when /anyone/i
      allow_anyone_element.click
    end

    save_continue_element.click
    sleep 5
    
  end

  def number_of_recipients

    total_recipient_element.send_keys @order_details['total_recipients']
    non_us_recipient_element.send_keys @order_details['non_us_recipients']
    
    sleep 2
    save_continue_element.click
    sleep 5
    save_continue_element.click
    sleep 5
  end

  def collect_email_or_not
    case @order_details['email_collect']
    when /yes/i
      collect_address_element.click
    when /no/i
      not_collect_address_element.click
    end

    sleep 2
    save_element.click
    sleep 5
  end

  def link_expiration
    save_continue_element.click
    sleep 5
  end

  def shipping_type
    standard_ship_element.click
    sleep 2
    save_element.click
    sleep 5
  end

  def message_send
    save_continue_element.click
    sleep 5
  end

  def customization
    no_customize_element.click
    sleep 2
    custom_next_element.click
    sleep 5
  end

  def checkout
    proceed_to_check_element.click
    sleep 5
    card_element.click
    sleep 2
    card_next_element.click
    sleep 5
    snack_wallet_element.click
    sleep 2
    place_element.click
    sleep 10
    no_invite_element.click
    sleep 2
    confirm_element.click
    sleep 10
  end
end