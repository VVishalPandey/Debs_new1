Feature: Test Debenhams Delivery/Payment functionality as a CCC user

@automated @DEBD-1977
Scenario: Navigate to customer online ordering tool as a CCC user go to bag page
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testChanelPerfPdpURL"
  # And I enter "dresses" in "searchField" on "commonPage"
  # And I click on "searchApply" on "commonPage"
  # And I click on "firstProductImage" on "pspPage"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "5000" milliseconds

@automated @DEBD-1977
Scenario: Navigate to delivery page as CCC user
  When I click on "checkoutButton" on "myBagPage"
  And I wait for "5000" milliseconds
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I click on "homeDeliveryOption" on "deliveryOptionPage"

@automated @DEBD-1977
Scenario Outline: Navigate to delivery page and validate email address field validations
  And I enter "<email>" in "cccEmailAddressField" on "homeDeliveryPage"
  And I click on "phoneNumber" on "homeDeliveryPage"
  And I should see "cccEmailAddressFieldError" exist on "homeDeliveryPage"
  Then I should see "cccEmailAddressFieldError" as "<error>" on "homeDeliveryPage"

  Examples:
  |email| error |
  |  | The Email address field cannot be empty |
  |uddhdh| The email entered is not in a valid format |

@automated @DEBD-1977
Scenario: Navigate to payment opage with valid delivery address
  When I am in view of "returnToBagIcon" on "homeDeliveryPage"
  And I click on "returnToBagIcon" on "homeDeliveryPage"
  And I wait for "5000" milliseconds
  When I click on "checkoutButton" on "myBagPage"
  When I select home delivery and provide UK address details
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "10000" milliseconds
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "deliveryType" exist on "paymentPage"
  And I should see "deliveryIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"

@automated @DEBD-1978 @DEBD-1977
Scenario Outline: Navigate to Order confirmation page as a ccc user  with test data card
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"
  And I wait for "5000" milliseconds
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  And I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"


  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           | security_num |
    | 4111111111111111   | visa      | 3 digits on the back | 4111 1111 1111 1111 | 123          |