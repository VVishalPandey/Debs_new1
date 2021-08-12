Feature: Test Debenhams ghost page from basket checkout page

@automated @DEBD-310
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the page
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "continueGuestRadioButton" on "loginPage"
  And I click on "continueButton" on "loginPage"
  Then I should see "helloTextGhostOverlay" as "Hello" on "loginPage"
  Then I should see "noticedCopyGhost1" as "We have noticed that there is an account" on "loginPage"
  And I should see "noticedCopyGhost2" as "related to this email address." on "loginPage"
  And I should see "noticedCopyGhost3" as "Would you like to…" on "loginPage"
  Then I should see "goToYourAccountText" as "Go to your account" on "loginPage"
  Then I should see "signInQuickerText" as "Sign in for a quicker checkout" on "loginPage"
  Then I should see "signedInEmail" as "<email>" on "loginPage"
  And I should see "forgotPasswordLink" exist on "loginPage"
  And I should see "passwordField" exist on "loginPage"
  And I should see "showHideButton" exist on "loginPage"
  And I should see "signInGhost" exist on "loginPage"
  And I should see "continueAsGuestGhostButton" exist on "loginPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DEBD-310
Scenario Outline: Navigate to Debenhams ghost page and validate invalid password
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInGhost" on "loginPage"
  Then I should see "errorMessageGhost" as "Password incorrect - Please check your details and try again." on "loginPage"

  Examples:
    | password |
    | test     |


@automated @DEBD-310
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and continue as a guest till delivery page
  And I click on "continueAsGuestGhostButton" on "loginPage"
  And I should see "url" contains "webapp/wcs/stores/servlet/SelectDeliveryMethodIntServiceOnlyView"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |


@automated @DEBD-310
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and sign in till delivery page
  Given I navigate to "homeURL"
  And I am on my details page
  And I logout
  And I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  When I click on "continueGuestRadioButton" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  When I click on "continueGuestRadioButton" on "loginPage"
  And I click on "continueButton" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInGhost" on "loginPage"
  And I should see "url" contains "webapp/wcs/stores/servlet/SelectDeliveryMethodIntServiceOnlyView"
  And I click on "logoDebenhamsDeliveryPage" on "deliveryOptionPage"
  And I should see "signOutLink" exist on "commonPage"
  Then I should not see "createAccountLink" on "commonPage"

  Examples:
    | email                       | password  |
    | testautomationd11@gmail.com | password2 |

@automated @DEBD-310
Scenario Outline: Navigate to bag login pop up and validate forgot password functionality
  And I logout
  And I navigate to "homeURL"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "continueGuestRadioButton" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  When I click on "continueGuestRadioButton" on "loginPage"
  And I click on "continueButton" on "loginPage"
  And I click on "forgotPasswordLink" on "loginPage"
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"

  Examples:
    | email                       |
    | testautomationd11@gmail.com |
