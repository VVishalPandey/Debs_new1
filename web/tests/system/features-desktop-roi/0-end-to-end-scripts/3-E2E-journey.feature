Feature: Test Debenhams end to end journey number 3

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to chanel perfume PDP page and validate the quantity selector is disabled when quantity set to 3 (max quantity)
  Given I logout
  When I navigate to "testChanelPerfPdpURL"
  And I enter "3" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"

@automatedSanity @preprodSanity @e2e
Scenario: Add quantity 2 and add to bag and store details from my bag
  Then I should validate minibag count "before"
  When I add to bag quantity "2" and go to my bag page
  Then I should validate minibag count "after"
  #And I should validate minibag count "diffence as 2"
  And I store details from myBag to validate later

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to delivery option as guest
  Then I navigate to delivery options as guest user

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to home delivery options by filling the UK address manually
  When I select home delivery and provide IE address details and navigate to delivery options under it
  #Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to payment page by selecting proceed payment button and validate the validate the page
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  # Then I should see "deliveryMessage" containing "excludes public holidays" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
#   And I should see "beautyCardAccordion" as "Pay with a Reward Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit or Debit card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I should not see "beautyClubCardPointIDField" on "paymentPage"
#   And I should see "beautyClubCardPointIDField" exist on "paymentPage"

@preprodSanity @e2e @scenarioObselete
Scenario: Validate the payment page delivery selected, credit card & beauty card points as selected by user
#   Then I should see "beautyClubCardPointText" containing "points on your Reward Club Card" on "paymentPage"
#   And I validate "beauty card points" value from mybag
  And I should see "deliveryType" containing "Standard Delivery" on "paymentPage"

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

@automatedSanity @preprodSanity @e2e @amexCardRemoved
Scenario Outline: Navigate to Debenhams payment page and validate the amex credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardIDError" as "Invalid card number - please try again" on "paymentPage"
  And I refresh the page
  Examples:
    | credit_card_number | cc_number         |
    | 378282246310005    | 3782 822463 10005 |

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
Scenario Outline: Navigate to Debenhams payment page and validate the maestro credit card icon
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
  Then I click on "creditCardSecurityNumber" on "paymentPage"
  And I should see "creditCardIDError" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 3530111333300000   | JCB       | 3 digits on the back | 3530 1113 3330 0000 |
