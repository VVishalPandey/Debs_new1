Feature: Test Debenhams Delivery/Payment functionality as a DSC user

@notAutomated @DEBD-2316
Scenario: Navigate to customer online ordering tool as a DSC user
  Given I logout
  When I am enacting as a customer using DSC
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testChanelPerfPdpURL"
  When I add to bag quantity "1" and go to my bag page

@notAutomated @DEBD-2316
Scenario: Navigate to payments page with saved address and delivery option as standard for DSC user
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
  And I should not see "daytimeTab" on "deliveryOptionPage"
  And I should not see "eveningTab" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within five working days" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@notAutomated @DEBD-2316
Scenario: Validate that saved cards,beauty card and gift card should not be displayed as card details in payment page for DSC user
  And I should not see "beautyClubCardPointRemoveLink" on "paymentPage"
  And I should not see "giftCard1AppliedRemoveLink" on "paymentPage"
  And I should not see "savedCardList" on "paymentPage"
  And I should not see "addNewPaymentCardLink" on "paymentPage"
  And I should not see "selectCardText" on "paymentPage"

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the visa credit card icon as DSC user
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  |      cc_number      |
    |   4111111111111111 | visa      | 3 digits on the back | 4111 1111 1111 1111 |

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the amex credit card icon as DSC user
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number |    icon_type     |  sec_num_digits_text  |     cc_number     |
    |    378282246310005 | american-express | 4 digits on the front | 3782 822463 10005 |

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon as DSC user
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type  | sec_num_digits_text  |      cc_number      |
    |   5555555555554444 | mastercard | 3 digits on the back | 5555 5555 5555 4444 |

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon as DSC user
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  |      cc_number      |
    |   6759270000000000 | maestro   | 3 digits on the back | 6759 2700 0000 0000 |

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the jcb credit card icon as DSC user
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  When I click on "billingAddressHeaderText" on "paymentPage"
  And I should see "creditCardIDError" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  |      cc_number      |
    |   3530111333300000 | JCB       | 3 digits on the back | 3530 1113 3330 0000 |

@notAutomated @DEBD-2316
Scenario Outline: Navigate to Debenhams payment page and validate the store card icon as DSC user
  When I enter "<store_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should not see "creditCardExpiryMonth" on "paymentPage"
  And I should not see "creditCardExpiryYear" on "paymentPage"
  And I should not see "creditCardSecurityNumber" on "paymentPage"
  And I should not see "creditCardDigitsText" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | store_card_number | icon_type |      cc_number      |
    |  6335864917026678 | debenhams | 6335 8649 1702 6678 |

@notAutomated @DEBD-1978 @DEBD-1977
Scenario Outline: Navigate to payment page and validate email address field validations in add enw billing address
  And I select user new billing address
  And I enter "<email>" in "cccEmailAddressField" on "homeDeliveryPage"
  And I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I should see "cccEmailAddressFieldError" exist on "homeDeliveryPage"
  Then I should see "cccEmailAddressFieldError" as "<error>" on "homeDeliveryPage"

  Examples:
  |email| error |
  | | The Email address field cannot be empty |
  |uddhdh| The email entered is not in a valid format |
