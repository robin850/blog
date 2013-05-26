Feature: Manage Comments
  In order to comment articles
  As a user or an admin
  I should be able to create a comment

  Scenario: Creating A Comment
    Given I have an article
    Given I have no comments
    When I go to the article's page
    Then I fill in "Votre nom" with "John Doe"
    Then I fill in "Votre commentaire" with "Hello world"
    Then I fill in "E-mail" with "foo@bar.net"
    When I submit the form
    Then I should see "Commentaire ajouté."
    And I should have 1 comment

  Scenario: Editing A Comment As An Admin
    Given I have an article
    Given I create a comment
    Given I am an admin user
    When I go to the article's page
    Then I should see "Modifier"
    Then I follow "Modifier"
    Then I fill in "Body" with "Foo bar"
    When I submit the form
    Then I should see "Comment mis à jour."
