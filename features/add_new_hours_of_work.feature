Feature: Add new hour
  As a user
  I want to add new hours of work

  Background:
    Given I have an account
    And I am logged in
    And I have clients

  Scenario: Fill the form with valid hours of work
    Given I am on my "Hour" list
    And I click on "New Hour"
    When I fill the hours of work form with valid data
    And I click on "Submit"
    Then I should see the details of the new hour

  Scenario: Client field blank
    Given I am on my "Hour" list
    And I click on "New Hour"
    When I fill the hours of work form with an empty client field
    And I click on "Submit"
    Then I should see an error message
