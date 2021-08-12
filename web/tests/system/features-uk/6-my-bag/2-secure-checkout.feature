Feature: Test Debenhams secure checkout button from my bag

@automated @DBNHST-231 @DBNHST-117
Scenario: Navigate to Debenhams my bag page as logged in user and select secure checkout
  Given I am logged in
  And I navigate to "basketCheckoutUrl"
  When I click on "checkoutButton" on "myBagPage"
  Then I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  And I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  Then I navigate to "loginUrl"
  And I logout
