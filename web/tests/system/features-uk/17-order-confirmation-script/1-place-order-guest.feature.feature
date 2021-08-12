Feature: Test Debenhams Order confirmation page

@automated @UK-orderConfirm
Scenario: Validate the product gets added in my when user select add to bag
  When I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I should see "testDressProductName" product name exist on myBagPage
  And I store details from myBag to validate later

@automated @UK-orderConfirm
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as ghost user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"

@automated @UK-orderConfirm
Scenario Outline: Navigate to Debenhams payment page and validate the visa credit card icon
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 4111111111111111   | visa      | 3 digits on the back | 4111 1111 1111 1111 |

@automated @UK-orderConfirm
Scenario Outline: Navigate to Debenhams payment page and provide Expiry and CVV number
  When I am in view of "creditCardIDField" on "paymentPage"
  Then I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"

  Examples:
    | security_num |
    | 123          |

@automated @UK-orderConfirm
Scenario: Validate the web loyalty pop up on order confirmation page and print the order number
  Then I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
