Feature: Test Debenhams header on home page

@automated @DEBD-343 @Fixed
Scenario: Validate the header links when user is not signed in
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I logout
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "personalFinanceLink" on "commonPage"
  
@automated @DEBD-343 @Fixed
Scenario: Validate the header links when user is signed in with valid credentials
  Given I logout
  And I am on my details page
  When I navigate to "intHomeURL"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should see "helloNameLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "personalFinanceLink" on "commonPage"