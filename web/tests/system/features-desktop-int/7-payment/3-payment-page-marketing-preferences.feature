Feature: Test Debenhams Payment page Marketing Preferences

@automated @DEBD-847
Scenario Outline: Validate the Right Panel on the Payment Page For Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "internationalDeliveryHeader" as "Where are we delivering to?" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should not see "creditCardPointText" on "paymentPage"
  And I should not see "creditCardPointIcon" on "paymentPage"
  And I should not see "beautyLoyaltyPoints" on "paymentPage"
  And I should see "promoCodeAccordion" exist on "paymentPage"
  And I should see "marketingPreferences" as "To opt out of receiving these communications, please tick the box" on "paymentPage"
  And I should see "productQuantityPPage" exist on "paymentPage"
  And I should see "productCostPPage" exist on "paymentPage"
  And I should see "shippingType" exist on "paymentPage"
  And I should see "shippingCost" exist on "paymentPage"
  And I should see "totalPayText" as "Total to pay" on "paymentPage"
  And I should see "totalPayValue" exist on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I should see "dutiesTaxesText" containing "This order may be subject to international import duties and taxes. Find out more" on "paymentPage"
  And I should see "dutiesTaxesLink" as "Find out more" on "paymentPage"
  And I should see "internationaltermsConditionText" containing "By clicking 'Place Order and Pay', you are agree to our" on "paymentPage"
  And I should see "internationaltermsConditionLink" as "terms & conditions." on "paymentPage"
  And I should see "internationaltermsConditionText" containing "When you place an order, Debenhams & our third parties process your data so we can fulfil your order & improve your shopping experience; see our" on "paymentPage"
  And I should see "internationalprivacyPolicyLinkPaymentPage" as "privacy policy" on "paymentPage"

Examples:
 |email                                  |password                |
 |testmarketingpreferencesint@test.com   |Sapient123              |

@manual @DEBD-847
Scenario: Validate the marketing preferences checkbox on payment page for Guest User
When I leave the "marketingPreferencesCheckbox" unticked
Then I will remain opted in to marketing messages if I create an account
When I tick the "marketingPreferencesCheckbox"
Then I be opted out to marketing messages if I create an account

@manual @DEBD-847
Scenario: Validate the marketing preferences checkbox on payment page for Registered User
  Given I navigate to "homeURL"
  Then I am on my details page
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I should see "marketingPreferencesText" as "tick to opt out" on "paymentPage"
  And I should see "marketingPreferencesCheckbox" as "unchecked" on "paymentPage"
  When I leave the "marketingPreferencesCheckbox" unticked
  Then I will remain opted in to marketing messages on my account
  When I tick the "marketingPreferencesCheckbox"
  Then I should be opted out to marketing messages on my account

@manual @DEBD-847
Scenario: Validate the marketing preferences checkbox opt out on payment page for Registered User
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I logout
  Then I am on my details page
  Then I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I should see "marketingPreferencesText" as "tick to opt in" on "paymentPage"
  And I should see "marketingPreferencesCheckbox" as "unchecked" on "paymentPage"
  When I leave the "marketingPreferencesCheckbox" unticked
  Then I will remain opted out to marketing messages on my account
  When I tick the "marketingPreferencesCheckbox"
  Then I should be opted out to marketing messages on my account

@manual @DEBD-1232
Scenario: Validate the marketing preferences checkbox opt out on payment page for German/Canadian Site
  Given that I am on the German or Canadian site
  And I have not previously selected a marketing preference (on my account)
  When I am on the payment page
  Then I will see the "tick to opt in" messaging
  And the checkbox will be unchecked by default
  When I leave the marketing preference checkbox unticked
  Then I will remain opted out to marketing messages on my account

@manual @DEBD-1232
Scenario: Validate the marketing preferences checkbox opt out on payment page for German/Canadian Site
  Given that I am on the German or Canadian site
  And I have not previously selected a marketing preference (on my account)
  And I am on the payment page
  When I tick the marketing preference checkbox
  Then I be opted in to marketing messages on my account
