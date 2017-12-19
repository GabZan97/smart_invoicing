Feature: Log In
  As a user
  I want to log in to my account

  Background:
    Given I have an account

  Scenario: Login successful
    Given I am on the login page
    When I fill in the login form with valid data
    And I click on "Submit"
    Then I should log in to my account

  Scenario: Email field blank
    Given I am on the login page
    When I leave the email field blank
    And I click on "Submit"
    Then I should get an error message

  Scenario: Password field blank
    Given I am on the login page
    When I leave the password field blank
    And I click on "Submit"
    Then I should get an error message

  Scenario: Invalid email
    Given I am on the login page
    When I enter an invalid email
    And I click on "Submit"
    Then I should get an error message

  Scenario: Invalid password
    Given I am on the login page
    When I enter an invalid password
    And I click on "Submit"
    Then I should get an error message
