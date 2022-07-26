Feature: Automate orders on snackmagic site

  Scenario Outline: Fill details in form
    Given I am on snackmagic site
    When I login with credentials for <order_number>
    And I start a new order
    And I fill all required details for <order_number>
    Then Order placed successfuly

    Examples:
      | order_number |
      | "order_1"    |