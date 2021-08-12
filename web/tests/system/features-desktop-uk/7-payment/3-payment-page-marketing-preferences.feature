Feature: Test Debenhams Payment page Marketing Preferences


@automated @DEBD-847
Scenario Outline: Validate the Right Panel on the Payment Page For Guest User
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "creditCardPointText" containing "Collect up to" on "paymentPage"
  And I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  And I should see "creditCardPointIcon" exist on "paymentPage"
  And I should not see "beautyClubCardPointContainer" on "paymentPage"
  And I should see "promoCodeAccordion" exist on "paymentPage"
  And I should see "marketingPreferences" as "To opt out of receiving these communications, please tick the box" on "paymentPage"
  And I should see "productQuantityPPage" exist on "paymentPage"
  And I should see "productCostPPage" exist on "paymentPage"
  And I should see "shippingType" exist on "paymentPage"
  And I should see "shippingCost" exist on "paymentPage"
  And I should see "totalPayText" as "Total to pay" on "paymentPage"
  And I should see "totalPayValue" exist on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I should see "termsConditionText" containing "By clicking 'Place Order and Pay', you are agreeing to our" on "paymentPage"
  And I should see "termsConditionLink" as "terms & conditions." on "paymentPage"
  And I should see "termsConditionText" containing "When you place an order, Debenhams & our third parties process your data so we can fulfil your order & improve your shopping experience; see our" on "paymentPage"
  And I should see "privacyPolicyLinkPaymentPage" as "privacy policy" on "paymentPage"

Examples:
 |email                               |password                |
 |testmarketingpreferences@test.com   |Sapient123              |

@manual @DEBD-847 @awsManual
Scenario: Validate the marketing preferences checkbox on payment page for Guest User
When I leave the "marketingPreferencesCheckbox" unticked
Then I will remain opted in to marketing messages if I create an account
When I tick the "marketingPreferencesCheckbox"
Then I be opted out to marketing messages if I create an account

@manual @DEBD-847 @awsManual
Scenario: Validate the marketing preferences checkbox on payment page for Registered User
  Given I logout
  Then I am on my details page
  And I am opted in to marketing on my account
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
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
  Given I logout
  Then I am on my details page
  And I am opted out of marketing on my account
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I should see "marketingPreferencesText" as "tick to opt in" on "paymentPage"
  And I should see "marketingPreferencesCheckbox" as "unchecked" on "paymentPage"
  When I leave the "marketingPreferencesCheckbox" unticked
  Then I will remain opted out to marketing messages on my account
  When I tick the "marketingPreferencesCheckbox"
  Then I should be opted out to marketing messages on my account
