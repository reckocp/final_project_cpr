Feature: Signing In and Out

    Scenario: A User Signs in
      Given I have an existing account
      When I go to the root path
      And I click "Sign In"
      And I fill in "Email" with "test@theironyard.com" within "#mySignInModal"
      And I fill in "Password" with "password" within "#mySignInModal"
      And I press "Log in"
      Then I should see "Signed in successfully."

    Scenario: A User Signs Out
      Given I have an existing account
      When I go to the root path
      And I click "Sign In"
      And I fill in "Email" with "test@theironyard.com" within "#mySignInModal"
      And I fill in "Password" with "password" within "#mySignInModal"
      And I press "Log in"
      Then I should see "Signed in successfully."
      When I click "Account"
      And I click "Sign Out"
      Then I should see "Signed out successfully."
