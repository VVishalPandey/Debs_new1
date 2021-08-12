Feature: Test Debenhams header functionality on CCC

@automated @DEBD-1975 @DEBD-1971
Scenario: Validate the header links when user is signed in with valid credentials on CCC
  Given I logout
  And I am enacting as a guest using CCC
  And I should see "cccDebsLogo" exist on "cccLoginPage"
  And I should see "cccGuestCheckoutPageHeader" exist on "cccLoginPage"
  And I should see "cccEmployeeName" exist on "cccLoginPage"
  And I should see "cccEmployeeNameLabel" exist on "cccLoginPage"
  And I should see "shopOnBehalfOfCustomerCTA" exist on "cccLoginPage"
  And I should see "cccManagePasswordLink" exist on "cccLoginPage"
  And I should see "cccSignOutLink" exist on "cccLoginPage"
  And I should see "shopOnBehalfOfCustomerCTA" exist on "cccLoginPage"

@automated @DEBD-1975
Scenario: Validate the My Account link redirection to Account details page and not you link behavior on CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  And I click on "myAccountLink" on "commonPage"
  Then I should see "headerText" as "My details" on "myDetailsPage"

@automated @DEBD-1971 @DEBD-1975
Scenario: Validate CSR user should be logged out on clicking of signout link
  And I should see "notYouLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  When I click on "notYouLink" on "commonPage"
  And I should see "cccheaderSignIn" as "CCC | Debenhams.com" on "cccLoginPage"
  And I should see "cccDebsLogoSignIn" exist on "cccLoginPage"

@notAutomated  @DEBD-2288
Scenario: Verify the Global banner for a DSC user
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should not see "cccSignInButton" on "cccLoginPage"
  And I search for a customer
  Then I select the customer from available search result list
  Then I can see a bright green banner at the top of the page
  And I will see, "You have enacted a Registered Customer's account"
  And I will see a "Drop customer session" CTA

@notAutomated @DEBD-2288
Scenario: Validate the behavior of CTA button present in the global banner
  Then I press the "Drop customer session" CTA
  And I will be taken to the Register customer search page
  And the session data will be cleared
