Feature: Test Debenhams end to end journey number 3

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to chanel perfume PDP page and validate the quantity selector is disabled when quantity set to 3 (max quantity)
  Given I logout
  Then I navigate to "homeURL"
  Then I navigate to "testChanelPerfPdpURL"
  And I enter "3" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Add quantity 2 and add to bag and store details from my bag
  And I enter "2" in "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I store details from myBag to validate later

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery option as guest
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  # And I should see "deliveryTypeheaderTextInt" as "How would you like to receive your order?" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to home delivery options by filling the UK address manually
  When I select home delivery and provide IE address details and navigate to delivery options under it
#   Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the options under Next nominated delivery option and select the first available daytime option
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payment page by selecting proceed payment button and validate the validate the page
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
#   And I should see "beautyCardAccordion" as "Pay with a Reward Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the payment page delivery selected, credit card & beauty card points as selected by user
  # Then I should see "beautyClubCardPointText" containing "points on your Reward Club Card" on "paymentPage"
  # And I validate "beauty card points" value from mybag
  # Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I am in view of "headerText" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  And I should see "deliveryType" containing "Standard Delivery" on "paymentPage"
  #And I should see "deliveryType" containing "Day Delivery" on "paymentPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the visa credit card icon
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  And I refresh the page

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 4111111111111111   | visa      | 3 digits on the back | 4111 1111 1111 1111 |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the amex credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"
  And I refresh the page

  Examples:
    | credit_card_number | icon_type        | sec_num_digits_text   | cc_number         |
    | 378282246310005    | american-express | 4 digits on the front | 3782 822463 10005 |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type  | sec_num_digits_text  | cc_number           |
    | 5555555555554444   | mastercard | 3 digits on the back | 5555 5555 5555 4444 |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 6759270000000000   | maestro   | 3 digits on the back | 6759 2700 0000 0000 |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Navigate to Debenhams payment page and validate the jcb credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  And I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 3530111333300000   | JCB       | 3 digits on the back | 3530 1113 3330 0000 |
