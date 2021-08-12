Feature: Test Debenhams header on home page

@automated @Fixed
Scenario: Validate the header links when user is not signed in
  Given I logout
  When I navigate to "homeURL"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "headerCreateAccountLink" exist on "commonPage"
  When I click on "menuIcon" on "commonPage"
  And I "validate" mainMenu option "Create Account/Sign In" on commonPage smallscreen
  
@automated @Fixed
Scenario: Validate the header links when user is signed in with valid credentials
  Given I logout
  Then I am on my details page
  When I navigate to "homeURL"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "headerCreateAccountLink" exist on "commonPage"
  When I click on "menuIcon" on "commonPage"
  And I "validate" mainMenu option "My Account" on commonPage smallscreen
  And I "validate" mainMenu option "Sign out" on commonPage smallscreen
  