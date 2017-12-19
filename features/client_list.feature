Feature: Client List
  As a user
  I want to see a list of all my clients

  Background:
    Given I have an account
    And I am logged in

  Scenario: The client list is not empty
    Given I have clients
    When I am on my "Client" list
    Then I should see the clients list
