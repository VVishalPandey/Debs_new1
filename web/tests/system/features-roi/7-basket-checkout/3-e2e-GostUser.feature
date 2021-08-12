Feature: Test Debenhams product checkout journey for ghost user taking click & collect delivery mode

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
  And I should see "addToBagRemainingText" as "has been added to your bag." on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should validate product name on "myBagPage"
  And I click on "countrySelectorpopupclose" on "commonPage"

@automated
Scenario Outline: Navigate to click & collect store locator page and validate the number of stores in result page with valid postcode search
  Then I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I should see "signInButton" exist on "ghostPage"
  And I should see "continueAsGuestButton" exist on "ghostPage"
  And I click on "continueAsGuestButton" on "ghostPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "clickCollectCTA" on "deliveryOptionPage"
  Then I should see "headerText" as "Which store would you like to collect from?" on "locateStorePage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"

  Examples:
    | email             | storeLocateName | max_count |
    | testvad@gmail.com | C15KF76         | 5         |

@automated
Scenario: Navigate to the payment page and validate the delivery option as click & collect
  When I click on "firstStoreChoose" on "locateStorePage"
  And I wait for "4000" milliseconds
  Then I should see "deliveryMessage" containing "Order now and your parcel should be available for collection" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  