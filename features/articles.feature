Feature: Manage Articles
  In order to make a blog
  As an admin
  I want to be able to manage articles

  Scenario: Index Action
    Given I have an article
    When I go to the the index action
    Then I should see "Foo Bar"
    And a link to see more

  Scenario: Sending A Valid Article
    Given I have no articles
    Given I am an admin user
    When I go to the new action
    Then I fill in "Title" with "Hello world"
    Then I fill in "Slug" with "hello-world"
    Then I fill in "Body" with "Lorem ipsum dolor sit amet"
    Then I choose "on"
    Then I click on "Envoyer"
    And I should see "Hello world"
    Then I should have 1 article

  Scenario: Sending An Invalid Article
    Given I have no articles
    Given I am an admin user
    When I go to the new action
    And I click on "Envoyer"
    Then I should see "doit"
    And I should have 0 article

  Scenario: Updating An Article
    Given I have an article
    Given I am an admin user
    When I go to the article's page
    Then I follow "éditer cet article"
    Then I fill in "Title" with "Foo bar"
    And I click on "Envoyer"
    Then I should see "Article mis à jour."
    And I should be on the article's page
