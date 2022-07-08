
Feature: automate youtube search

  Scenario: open google and search youtube
    Given I am on google page
    When I search youtube in search bar
    Then show search results on new page

  Scenario: open youtube.com
    Given I am on search result page
    When I click first search result
    Then Redirect to youtube.com

  Scenario: search on youtube seachbar
    Given I am on youtube.com
    When I search selenium in search bar
    Then Redirect to video seaches for selenium
