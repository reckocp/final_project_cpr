Feature: Signing In and Out

    Scenario: A User Signs in
      Given I have an existing account
      When I go to the root path
      And I click "Sign In"
      And I fill in "Email" with "test@theironyard.com" within "#mySignInModal"
      And I fill in "Password" with "password" with "#mySignInModal"
      And I press "Log In" within "#mySignInMOdal"
