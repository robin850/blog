Feature: Manage categories

  Scenario: Creating a category
    Given I have no category
    Given I am an admin user
    When I go to the categories new page
    Then I fill in "Name" with "Ruby"
    Then I fill in "Slug" with "ruby"
    Then I click on "Envoyer"
    Then I should see "Ruby"

  Scenario: Sending an indalid form
    Given I have no category
    Given I am an admin user
    When I go to the categories new page
    Then I fill in "Name" with "Foo"
    Then I click on "Envoyer"
    Then I should see "Slug"
    Then I should have 0 categories