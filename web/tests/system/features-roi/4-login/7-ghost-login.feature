Feature: Test Debenhams ghost page from basket checkout page

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the page
  Given I navigate to "womenDressesPdpUrl"
  Then I should not see "sizeswatch" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I should see "signInButton" exist on "ghostPage"
  And I should see "continueAsGuestButton" exist on "ghostPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DDAI-322 @DDAI306
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on sign in button
  Given I navigate to "womenDressesPdpUrl"
  Then I should not see "sizeswatch" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  When I click on "signInButton" on "ghostPage"
  # Then I should see "titleOfPage" as "Shopping Bag" on "basketCheckoutPage"
  Then I should see "headerText" as "Welcome" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"
  And I should see "backSection" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the back button functionality
  Given I navigate to "womenDressesPdpUrl"
  Then I should not see "sizeswatch" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  When I click on "backSection" on "basketCheckoutPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  # And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  When I click on "backSection" on "ghostPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  # And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@automated @DDAI-322 @DDAI306
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on continue as guest button
  Given I navigate to "womenDressesPdpUrl"
  Then I should not see "sizeswatch" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  When I click on "continueAsGuestButton" on "ghostPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |
