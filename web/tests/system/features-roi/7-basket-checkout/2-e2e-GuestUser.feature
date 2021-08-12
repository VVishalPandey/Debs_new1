Feature: Test Debenhams product checkout journey for guest user providing new delivery address

@automated
Scenario: Navigate to tableware products with price less than €5
  Given I logout
  Then I navigate to "productsUnder€5"
  And I should see "searchText" as "Under €5" on "pspPage"

@automated
Scenario: Select 1st available product on psp and add to bag the same on pdp
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"

@automated
Scenario: Navigate to delivery option as guest
  Then I click on "miniBagButton" on "pdpPage"
  Then I click on "secureCheckoutButton" on "minibagPage"
  And I click on "countrySelectorpopupclose" on "commonPage"
  Then I navigate to delivery options as guest user
  And I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"

@automated
Scenario: Navigate to home delivery options by filling the IE address manually
  When I select home delivery and provide IE address details and navigate to delivery options under it
  Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"

@automated
Scenario: Validate the options under Next nominated delivery option and select the first available daytime option
  When I click on "nextNominatedOption" on "deliveryOptionPage"
  Then I should see "headerText" as "When would you like to receive your delivery?" on "deliveryOptionPage"
  And I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  And I validate all options under daytime
  And I validate first evening and daytime option navigation
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automated
Scenario: Navigate to payment page by selecting proceed payment button and validate the validate the page
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "beautyCardAccordion" as "Pay with a Beauty Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I should see "beautyClubCardPointIDField" exist on "paymentPage"

@automated
Scenario: Validate the payment page delivery selected, credit card & beauty card points as selected by user
  Then I should see "beautyClubCardPointText" containing "points on your Beauty Club Card" on "paymentPage"
  And I should see "creditCardPointText" containing "Points by paying with your Debenhams Credit Card." on "paymentPage"
  And I validate "beauty card points" value from mybag
  And I validate "credit card points" value from mybag
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Next Day Delivery" on "paymentPage"
  