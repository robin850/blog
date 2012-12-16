Feature: Search

  Scenario: Basic search
    Given I have the following article
      |    title     |      body      |     slug     |  
      | Lorem ipsum  | dolor sit amet | lorem-ipsum  |  
      | What is Ruby |    Foo Bar     | what-is-ruby |  
    When I go to the index action
    Then I should see "Lorem ipsum"
    Then I should see "What is Ruby"
    Then I fill in "query" with "Ruby"
    Then I click on "submit"
    Then I should see "What is Ruby"
