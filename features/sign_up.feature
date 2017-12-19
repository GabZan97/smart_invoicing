Feature: Sign Up
  As a user
  I want to create my account


  Scenario: Signup successful
    Given I am on the home page
    And I click on "Sign Up"
    When I fill in the form with valid data
    And I click on "Submit"
    Then I should create my account

    Scenario: Leaving name field blank
      Given I am on the home page
      And I click on "Sign Up"
      When I fill in the form with valid data
      And I leave the "Name" field blank
      And I click on "Submit"
      Then I should see an error message

      Scenario: Leaving email field blank
        Given I am on the home page
        And I click on "Sign Up"
        When I fill in the form with valid data
        And I leave the "Email" field blank
        And I click on "Submit"
        Then I should see an error message

        Scenario: Leaving password field blank
          Given I am on the home page
          And I click on "Sign Up"
          When I fill in the form with valid data
          And I leave the "Password" field blank
          And I click on "Submit"
          Then I should see an error message
