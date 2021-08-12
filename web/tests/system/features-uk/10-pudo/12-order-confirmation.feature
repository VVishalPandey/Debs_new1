Feature: Test Debenhams order placement with different cards (non3ds/V1/V2 cards) with PUDO enabled

@automated @DEBD-3232 @DEBD-3538
Scenario Outline: Validate order confirmation page with non 3DS cards payments for delivery type as C & C with Debenhams store as selected
  Given I logout
  Then I am on my details page
  Then I navigate to "debenhamsStoreClickCollectPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "E16FQ" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "Tick symbol" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should see "orderText1" as "We've received your order" on "orderConfirmationPage"
  And I should see "orderText2" as "A copy of your receipt has been sent to xx@email.com" on "orderConfirmationPage"
  And I should see "orderText3" as "Delivery lead time (e.g. Your order will be ready to collect after 2 pm on Wednesday 15 October and will be available for 14 days)" on "orderConfirmationPage"
  And I should see "debenhamsLogo" exist on "orderConfirmationPage"
  And I should see "locationName" exist on "orderConfirmationPage"
  And I should see "distanceInMiles" exist on "orderConfirmationPage"
  And I should see "storeAddress" exist on "orderConfirmationPage"
  And I should not see "telephoneNo" on "orderConfirmationPage"
  And I should see "collectionLocation" exist on "orderConfirmationPage"
  When I "collapse" "openingHours" accordion on "orderConfirmationPage"
  When I "expand" "openingHours" accordion on "orderConfirmationPage"
  Then I should see "openingTime" exist on "orderConfirmationPage"
  Then I should see "map" exist on "orderConfirmationPage"
  And I should see the location of the search (postcode/town/city) on the map

  Examples:
    | credit_card_number | sec_num_digits_text  | security_num | cc_number           | icon_type        |
    | 4111111111111111   | 3 digits on the back | 123          | 4111 1111 1111 1111 | VISA             |


@automated @DEBD-3232 @DEBD-3538
Scenario Outline: Validate order confirmation page with non 3DS cards payments for delivery type as C & C with Parcel store as selected
  Given I logout
  Then I am on my details page
  Then I navigate to "parcelStoreClickCollectPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "E16FQ" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I should see "Tick symbol" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should see "orderText1" as "We've received your order" on "orderConfirmationPage"
  And I should see "orderText2" as "A copy of your receipt has been sent to xx@email.com" on "orderConfirmationPage"
  And I should see "orderText3" as "Your order will be ready to collect in xx working days, we'll email once its arrived in store (for express delivery) and will be available for 14 days" on "orderConfirmationPage"
  And I should see "parcelShopLogo" exist on "orderConfirmationPage"
  And I should see "locationName" exist on "orderConfirmationPage"
  And I should see "distanceInMiles" exist on "orderConfirmationPage"
  And I should see "storeAddress" exist on "orderConfirmationPage"
  And I should see "telephoneNo" exist on "orderConfirmationPage"
  And I should not see "collectionLocation" on "orderConfirmationPage"
  When I "collapse" "openingHours" accordion on "orderConfirmationPage"
  When I "expand" "openingHours" accordion on "orderConfirmationPage"
  Then I should see "openingTime" exist on "orderConfirmationPage"
  Then I should see "map" exist on "orderConfirmationPage"
  And I should see the location of the search (postcode/town/city) on the map

  Examples:
    | credit_card_number | sec_num_digits_text  | security_num | cc_number           | icon_type        |
    | 4111111111111111   | 3 digits on the back | 123          | 4111 1111 1111 1111 | VISA             |