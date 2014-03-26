#encoding: utf-8
Feature: As a user, I want to be able to add an idea, edit an idea, delete an idea. I should be able to see ideas that others have made, comment to them and also be subscribed and be notified to future events. Finally, I should be able to search for and see a history of ideas.

Scenario: Filter the idea list
    Given some ideas in the collection
    When I visit the list of ideas
    And I search for "Cor"
    Then I only see ideas matching the search term
    When I remove the filter
    Then I see all ideas again