Feature: Fill google form using data magic gem

  Scenario Outline: Fill details in form
    Given I am on google form
    When fill the form for <detail_no>
    Then Response submitted successfully
    Examples:
      | detail_no |
      | "Detail1" |
      | "Detail2" |


