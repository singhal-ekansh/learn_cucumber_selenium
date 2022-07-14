Feature: automate youtube search

  Scenario: open google and search youtube
    Given I am on google page
    When I search youtube in search bar
    Then show search results on new page