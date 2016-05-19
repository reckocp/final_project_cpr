Feature: Creating Posts, Spotlights and Events

  @javascript
  Scenario: An Admin Creates An Event
    Given I have an existing admin account
    When I go to the root path
    And I click "Sign In"
    And I fill in "Email" with "admin@theironyard.com" within "#mySignInModal"
    And I fill in "Password" with "password" within "#mySignInModal"
    And I press "Log in"
    Then I should see "Signed in successfully."
    When I click "Local"
    And I press "Create Event"
    And I fill in "Title" with "Demo Day" within "#newEventModal"
    And I fill in "Description" with "Iron Yard students display their projects" within "#newEventModal"
    And I fill in "Location" with "The Iron Yard - Austin" within "#newEventModal"
    And I fill in "Date" with "05/20/2017" within "#newEventModal"
    And I fill in "Start time" with "05:00 PM" within "#newEventModal"
    And I fill in "End time" with "07:00 PM" within "#newEventModal"
    And I press "Submit" within "#newEventModal"
    Then I should see "Event was successfully created."

  Scenario: A User Creates a Post
    Given I have an existing account
    When I go to the root path
    And I click "Sign In"
    And I fill in "Email" with "test@theironyard.com" within "#mySignInModal"
    And I fill in "Password" with "password" within "#mySignInModal"
    And I press "Log in"
    Then I should see "Signed in successfully."
    When I click "Local"
    And I press "Create Post"
    And I fill in "Link" with "http://www.google.com" within "#myCreatePostsModal"
    And I fill in "Link title" with "Google" within "#myCreatePostsModal"
    And I fill in "Summary" with "Check it out" within "#myCreatePostsModal"
    And I press "Submit" within "#myCreatePostsModal"
    Then I should see "Post was successfully created."

  Scenario: An Admin Creates A Spotlight
    Given I have an existing admin account
    When I go to the root path
    And I click "Sign In"
    And I fill in "Email" with "admin@theironyard.com" within "#mySignInModal"
    And I fill in "Password" with "password" within "#mySignInModal"
    And I press "Log in"
    Then I should see "Signed in successfully."
    When I click "Local"
    And I press "Create Spotlight"
    And I fill in "Title" with "Demo Day" within "#newSpotlightModal"
    And I fill in "Description" with "The Iron Yard grads present their final projects!" within "#newSpotlightModal"
    And I fill in "Date" with "05/19/2016" within "#newSpotlightModal"
    And I fill in "Link" with "http://www.google.com" within "#newSpotlightModal"
    And I press "Submit" within "#newSpotlightModal"
    Then I should see "Spotlight was successfully created."
