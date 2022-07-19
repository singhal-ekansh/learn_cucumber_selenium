Feature: Fill contact us form of website

  Scenario: Fill in contact form of cricbuzz website
    Given I am on Cricbuzz site
    When I click More option from taskbar
    And Click contact us from dropdown
    And Fill details in form
    And Click submit button
    Then form submitted successfuly