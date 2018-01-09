Feature: Delete clients
  As a user
  I want to delete a client

  Background:
    Given I have an account
    And I am logged in
    And I have at least a client
    And I have hours of work

  Scenario: Delete a client
    Given I am on the clients list
    When I click on "Destroy"
    Then I should not see "Random" on my client list
    And All the hours associated to that client should be destroyed
