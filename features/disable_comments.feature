Feature: Disable comments

  Scenario: When comments are enabled
    Given I have the following article
      | title        | body           | slug         | commentable |
      | Hello world  | Foo bar        | hellow-world | 1           |
    When I go to the article's page
    Then I should see "Poster un commentaire"
    And I should see "Votre nom"
    And I should see "E-mail"
    And I should see "Votre commentaire"

  Scenario: When comments are disabled
    Given I have the following article
      | title        | body           | slug         | commentable |
      | Hello world  | Foo bar        | hellow-world | 0           |
    When I go to the article's page
    Then I should not see "Poster un commentaire"
    And I should not see "Votre nom"
    And I should not see "E-mail"
    But I should see "Les commentaires sont désactivés"
