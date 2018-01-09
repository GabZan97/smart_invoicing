Feature: Delete hours of work
  As a user
  I want to delete hours of work done for a client

  Background:
    Given I have an account
    And I am logged in
    And I have at least a client
    And I have hours of work

  Scenario: Delete an hour of work
    Given I am on the hours of work list
    When I click on "Destroy" hour
    Then I should not see that hour on my hour list
