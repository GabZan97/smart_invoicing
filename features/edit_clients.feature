Feature: Edit clients
  As a user
  I want to edit client's information

  Background:
    Given I have an account
    And I am logged in
    And I have at least a client
    And I have hours of work

  Scenario: Editing Successfully
    Given I am on my "Client" list
    And I click on "Edit"
    When I change the client's name to some other name
    And I click on "Submit"
    Then The client should be updated

  Scenario: Leaving empty field
    Given I am on my "Client" list
    And I click on "Edit"
    When I leave a field empty
    And I click on "Submit"
    Then I should see an error message
