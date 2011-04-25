@javascript
Feature: In order to verify that cucumber works
  As a developer
  I want to run a scenario

  Scenario: Visiting google
    Given I am at google
    Then show me the page
    Then I should see "google.com"
