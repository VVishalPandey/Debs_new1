Feature: Test Debenhams Partial Login functionality


@manual @DEBD-484
Scenario: Validation of the  Welcome Page when the user is partially logged out 
  Given the user is logged in 
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the Email address field on the page should not be prepopulated
  And I should see the greeted by name
  And the THE MESSAGE on the screen should read, Welcome Back Please re-enter your email address and password to continue.
  And I should see  email and password field
  And I should see  Forgotten your password link
  And I should see the Sign in CTA


@manual @DEBD-484
Scenario Outline: Validation of the login from Welcome page via Partial login
  Given the user is logged in 
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "My Account" exist on "myAccount"

  Examples:
    | email           | password |
    | user1@gmail.com | pass1    |


@manual @DEBD-484
Scenario: Validation of the prefilled email and password in the Welcome Page
  Given the user is logged in and credeitials are saved in browser
  And the user adds the products 
  And navigates to the basket page 
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the Email address & Password field on the page should  be prepopulated
  And I should see the greeted by name
  And the THE MESSAGE on the screen should read, Welcome Back Please re-enter your email address and password to continue

@manual @DEBD-484
Scenario: Validation of the header and not you functionality for partial login user
  Given the user is logged in
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And I should see the "Hello, username, (not you?)" on common page
  And I click on "Notyou" on "commonPage"
  And I should see "MyAccount" exist on "loginPage"
  And I should see "SignIn"  exist on "commonPage"

@manual @DEBD-484
Scenario: Validation of the session not getting timed out for  less than 30 minutes
  Given the user is not logged in 
  And the user adds the products to the basket page
  When the user is inactive for 20 min
  Then the user should not be session timed out
  And should not see the "Welcome Back" page
