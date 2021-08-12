Feature: Test Debenhams ghost page from basket checkout page

@automated  @DBNHST-6 @Fixed
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the page
  Given I navigate to "testDressPdpURL"
  # When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "WE HAVE NOTICED THAT THERE IS AN ACCOUNT" on "ghostPage"
  And I should see "signInButton" exist on "ghostPage"
  And I should see "continueAsGuestButton" exist on "ghostPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DBNHST-6 @Fixed
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on sign in button
  Given I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "WE HAVE NOTICED THAT THERE IS AN ACCOUNT" on "ghostPage"
  And I wait for "2000" milliseconds
  And I enter "<password>" in "passwordField" on "loginPage"
  When I click on "signInButton" on "ghostPage"
  And I wait for "10000" milliseconds
  And I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I click on "logoDebenhamsDeliveryPage" on "deliveryOptionPage"
  And I wait for "5000" milliseconds
  When I click on "menuIcon" on "commonPage"
  And I "validate & click" mainMenu option "My Account" on commonPage smallscreen
  
  Examples:
    | email                      |  password |
    | testautomationd2@gmail.com | password2 |

@automated @DBNHST-6 @Fixed
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the back button functionality
  Given I logout
  When I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "WE HAVE NOTICED THAT THERE IS AN ACCOUNT" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "backSection" on "ghostPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DBNHST-6 @DBNHST-117 @Fixed
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on continue as guest button
  Given I logout
  When I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "WE HAVE NOTICED THAT THERE IS AN ACCOUNT" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "continueAsGuestButton" on "ghostPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |
