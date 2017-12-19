Feature: See the hour List
  As an admin
  I want to see a list of all the hours of work I have worked

  Background:
    Given I have an account
    And I am logged in
    And I have clients

  Scenario: The hour list is not empty
    Given I have hours of work
    When I am on my "Hour" list
    Then I should see my hours of work list

  Scenario: The hour list is empty
    Given I don't have hours of work
    When I am on my "Hour" list
    Then I should not see any hours of work
