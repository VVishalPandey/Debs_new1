Feature: Test Debenhams Pay By Card on Payment page

@automated @DEBD-164
Scenario Outline: Validate the Pay By Card Accordion on Payment Page For Registered User
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
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
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "securePayment" as "SECURE PAYMENT" on "paymentPage"
  And I should see "padLockIcon" exist on "paymentPage"
  And I should see "creditCardIcons" exist on "paymentPage"
  And I verify "xlink:href" of "storeCardIcon" as "storeCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "masterCardIcon" as "masterCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "visaCardIcon" as "visaCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "amexCardIcon" as "amexCardIconImage" on "paymentPage"
  And I verify "xlink:href" of "maestroCardIcon" as "maestroCardIconImage" on "paymentPage"
  And I should see "creditCardIDField" exist on "paymentPage"
  And I should see "expirtyDate" as "Expiry date" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumberLabel" as "Security number" on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardSecurityNumberIcon" exist on "paymentPage"
  And I should see "creditCardSecurityNumberHint" exist on "paymentPage"
  And I should see "saveThisCardCheckbox" exist on "paymentPage"

Examples:
 |email                               |password        |
 |testautomationwithnocard@test.com   |Sapient123      |


@automated @DEBD-164
Scenario: Navigate to Debenhams payment page and validate the credit card error message for empty fields
  When I enter " " in "creditCardIDField" on "paymentPage"
  And I enter " " in "creditCardSecurityNumber" on "paymentPage"
  And I click on "creditCardExpiryMonth" on "paymentPage"
  And I click on "creditCardExpiryYear" on "paymentPage"
  Then I should see "creditCardIDError" as "Please enter your card number." on "paymentPage"
  And I should see "creditCardExpiryDateError" as "Please enter the expiry date of your payment card." on "paymentPage"
  And I should see "creditCardSecurityNumError" as "Please enter a valid security number." on "paymentPage"

@automated @DEBD-164
Scenario Outline: Navigate to Debenhams payment page and validate the credit card error message for less than 16 digits
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_sec_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I should see "creditCardIDError" as "Card number must be more than 15 digits." on "paymentPage"

  Examples:
    | credit_card_number | credit_card_sec_num |
    | 4111               |                     |

@automated @DEBD-164
Scenario Outline: Navigate to Debenhams payment page and validate the credit card icon
  When I am in view of "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I verify "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type         | sec_num_digits_text   | cc_number           |
    | 4111111111111111   | visaIconType      | 3 digits on the back  | 4111 1111 1111 1111 |
    | 6759270000000000   | meastroIconType   | 3 digits on the back  | 6759 2700 0000 0000 |
    | 5555555555554444   | masterIconType    | 3 digits on the back  | 5555 5555 5555 4444 |
    | 378282246310005    | amexIconType      | 4 digits on the front | 3782 822463 10005 |
    | 378282246310005    | amexIconType      | 4 digits on the front | 3782 822463 10005 |

@automated @DEBD-164
Scenario Outline: Navigate to Debenhams payment page and validate the Debenhams credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should not see "creditCardSecurityNumber" on "paymentPage"
  And I should not see "creditCardDigitsText" on "paymentPage"
  And I verify "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type        | cc_number           |
    | 6319338020630353   | debsCardIconType | 6319 3380 2063 0353 |

@manual @DEBD-164
Scenario: Validate the card number spacing after entry
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I enter "cardNumber" in "cardNumberField" on "paymentPage"
  Then I should see card number as separated into groups of 4, as it's written on my credit card e.g. 4012 0010 1100 0771

@manual @DEBD-164
Scenario: Validate the highlighting of relevant card icon
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I type the first 4 digits
  Then the BIN range is recognised e.g. 4102
  And  the appropriate card icon e.g. visa next to the card number input field will highlight in the list of icons
  And the non-relevant icons will go a darker shade
  And I won't see the card icon within the card number input field
  When I delete more than the first four digits of the payment card
  Then all the card icons will come back into focus


@manual @DEBD-2612
Scenario Outline: Validate CVV unhide functionaity for Debenhams old/new store Card if no card has been saved using debenhamsMVT
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And  I should see "<icon_type>" exist on "paymentPage"
  And I should see "cvv_field" exist on "paymentPage"
  When I enter "<cvv_field>" in "cvvField" on "paymentPage"

  Examples:
    | credit_card_number    | icon_type        | cvv_field|
    | 6319 3387 2037 9046   | debsCardIconType | 811      |
    | 4111111111111111   | visaIconType        | 123      |
    | 6319 3387 2037 9046   | debsCardIconType | 811      |
    | 6759270000000000   | meastroIconType     | 123      |
    | 5555555555554444   | masterIconType      | 123      |
    | 6319 3387 2037 9046   | debsCardIconType | 811      |
    | 378282246310005    | amexIconType        | 1234     |
    | 378282246310005    | amexIconType        | 1234     |
    | 6319 3380 2014 3613   | debsCardIconType | 132      |
    | old Store card |  | |
    | 378282246310005    | amexIconType        | 1234     |

@manual @DEBD-2612
Scenario Outline: Validate CVV unhide functionaity for Debenhams newday/Old store Card if cards has been saved as part of My Account using debenhamsMVT
  Given I logout
  And I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I select "<cardType>" from paymnet dropdown
  And I should see "cvv_field" exist on "paymentPage"

Examples:
   | creditCardType      |
   | mastercard          |
   | visa                |
   | Amex                |
   | Debenhams New Store Card|
   | Amex                |
   | Debenhams Old Store Card|
   | mastercard          |
   | Maestro             |


@manual @DEBD-2612
Scenario Outline: Validate order placement using Debenhams newday/Old store card using debenhamsMVT
  Given I logout
  And I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I select "<credit_card_number>" from paymnet dropdown
  And I should see "cvv_field" exist on "paymentPage"
  When I enter "<cvv_field>" in "cvvField" on "paymentPage"
  And I click on "placeOrder" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should validate order is sucessfully through order management system

  Examples:
    | credit_card_number    | icon_type         | cvv_field|
    | 6319 3387 2037 9046   | debsCardIconType  | 811      |
    | 6319 3380 2014 3613   | debsCardIconType  | 132      |


@manual @DEBD-2612
Scenario Outline: Validate error message of blank cvv or incorrect cvv for Debenhams old store card while placing an order using debenhamsMVT
  Given I logout
  And I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I select "<credit_card_number>" from paymnet dropdown
  And I should see "cvv_field" exist on "paymentPage"
  When I enter "<cvv_field>" in "cvvField" on "paymentPage"
  And I click on "placeOrder" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  And I should validate order is sucessfully through order management system

  Examples:
    | credit_card_number    | icon_type         | cvv_field|
    | 6319 3387 2037 9046   | debsCardIconType  | 811      |
    | 6319 3380 2014 3613   | debsCardIconType  | 132      |


@manual @DEBD-2612
Scenario Outline: Validate error message of blank cvv or incorrect cvv for Debenhams old store card while placing an order using debenhamsMVT
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I select "<credit_card_number>" from payment dropdown
  And I should see "cvv_field" exist on "paymentPage"
  When I enter "<cvv_field>" in "cvvField" on "paymentPage"
  And I click on "placeOrder" on "paymentPage"
  And I should see "errorMessage" exist on "paymentPage"

  Examples:
    | credit_card_number    | icon_type         | cvv_field| errorMessage |
    | 6319 3387 2037 9046   | debsCardIconType  |          |incorrect or emty cvv|
    | 6319 3380 2014 3613   | debsCardIconType  | 123      | Payment authorization error |


@manual @DEBD-2612
Scenario: Validate cvv length of old new day store card or new day store card in payment page using debenhamsMVT
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  And I verify cvv length of card should be 3

