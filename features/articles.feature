Feature: Manage Articles
  In order to make a blog
  As an admin
  I want to be able to manage articles

  Scenario: Index Action
    Given I have an article
    When I go to the index action
    Then I should see "Foo Bar"
    And a link to see more
