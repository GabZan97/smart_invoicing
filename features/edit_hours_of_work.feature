Feature: Edit Hours of Work
  As a user
  I want to edit hours of work

  Background:
    Given I have an account
    And I am logged in
    And I have at least a client
    And I have hours of work

  Scenario: Client field blank
    Given I am on my "Hour" list
    And I want to edit an hour of work
    When I change the client field to empty
    And I click on "Submit"
    Then I should see an error message
