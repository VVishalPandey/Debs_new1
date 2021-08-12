Feature: Test Debenhams header on home page

@automated @DEBD-343
Scenario: Validate the header links when user is not signed in
  Given I logout
  When I navigate to "homeURL"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should not see "notYouLink" on "commonPage"
  And I should not see "helloNameLink" on "commonPage"
  And I should not see "myAccountLink" on "commonPage"
  And I should not see "signOutLink" on "commonPage"
  
@automated @DEBD-343
Scenario: Validate the header links when user is signed in with valid credentials
  Given I logout
  And I am on my details page
  When I navigate to "homeURL"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should see "helloNameLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should not see "createAccountLink" on "commonPage"
  