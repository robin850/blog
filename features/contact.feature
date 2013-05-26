Feature: Contact

  Scenario: Basic integration
    Given I have no deliveries
    When I go to the contact page
    Then I fill in "Votre nom" with "John Doe"
    Then I fill in "Votre e-mail" with "john@doe.net"
    Then I fill in "Message" with "Lorem ipsum"
    Then I click on "Envoyer"
    Then I should have 1 delivery

  Scenario: Invalid form
    Given I have no deliveries
    When I go to the contact page
    Then I click on "Envoyer"
    Then I should see "nom"
    Then I should see "email"
    Then I should see "message"
    Then I should have 0 deliveries
