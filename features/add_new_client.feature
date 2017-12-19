Feature: Add new client
  As an admin
  I want to create new clients

  Background:
    Given I have an account
    And I am logged in

  Scenario: Client addition successful
    Given I am on my "Client" list
    And I click on "New Client"
    When I fill the client form with valid data
    And I click on "Submit"
    Then I should see the new client in the list

  Scenario: Name field blank
    Given I am on my "Client" list
    And I click on "New Client"
    When I fill in the add new client form with a blank name
    And I click on "Submit"
    Then I should see an error message

  Scenario: Codice fiscale field blank
    Given I am on my "Client" list
    And I click on "New Client"
    When I fill in the add new client form with a blank codice fiscale
    And I click on "Submit"
    Then I should see an error message

  Scenario: Email field blank
    Given I am on my "Client" list
    And I click on "New Client"
    When I fill in the add new client form with a blank email
    And I click on "Submit"
    Then I should see an error message

  Scenario: Partita iva field blank
    Given I am on my "Client" list
    And I click on "New Client"
    When I fill in the add new client form with a blank partita iva
    And I click on "Submit"
    Then I should see an error message
