Feature: Test Debenhams payment page

@automated @DBMTE-74
Scenario: Navigate to Debenhams payment page and validate the page
  Given I logout
  Then I am on my details page
  When I navigate to mybag and empty the bag
  And I navigate to "testlipstickUrl"
  And I am in view of "allSizeElements" on "pdpPage"
  Then I click on "addToBagButton" on "pdpPage"
  And I navigate to "testFurniturePdpURL"
  Then I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  #And I add the product to bag and go to my bag page
  And I should see "testBeautyProductName" product name exist on myBagPage
  And I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  When I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your items will be delivered separately." on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "beautyCardAccordion" as "Pay with a Beauty Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@manual @DBMTE-74
Scenario: Validate payment chevron is highlighted
  Then I should see payment chevron highlighted

@automated @DBMTE-74
Scenario: Navigate to Debenhams payment page and validate debenhams club card points
  Then I should see "creditCardPointText" containing "Points by paying with your Debenhams Credit Card." on "paymentPage"
  And I validate "credit card points" value from mybag

@automated @DBMTE-74
Scenario: Navigate to Debenhams payment page and validate order summary
  And I click on "orderSummaryAccordion" on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"
  And I should validate the "deliveryLeadTime" of product "1" under orderDetails
  And I should validate the "deliveryLeadTime" of product "2" under orderDetails
  And I should validate the "image" of product "1" under orderDetails
  And I should validate the "image" of product "2" under orderDetails
  And I should validate the "options" of product "1" under orderDetails
  And I should validate the "options" of product "2" under orderDetails
  And I should validate the "quantity" of product "1" under orderDetails
  And I should validate the "quantity" of product "2" under orderDetails
  And I should validate the "price" of product "1" under orderDetails
  And I should validate the "price" of product "2" under orderDetails
  And I should validate the "title" of product "1" under orderDetails
  And I should validate the "title" of product "2" under orderDetails
  And I validate the order bill details on paymentPage
  And I should see "totalPayText" exist on "paymentPage"
  And I should see "totalPayValue" exist on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"
  And I should see "termsConditionText" exist on "paymentPage"
  And I should see "newsLetterRadioButton" exist on "paymentPage"
  And I should see "privacyPolicyText" exist on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate debenhams beauty club card points
  Then I am in view of "beautyClubCardPointText" on "paymentPage"
  Then I should see "beautyClubCardPointText" containing "points on your Beauty Club Card" on "paymentPage"
  And I validate "beauty card points" value from mybag

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate debenhams beauty club card points section
  Then I should see "beautyClubCardPointApply" exist on "paymentPage"
  And I should see "beautyClubCardPointPreID" as "<beauty_point_pre_id>" on "paymentPage"
  And I should see "beautyClubCardPointIDField" exist on "paymentPage"

  Examples:
    | beauty_point_pre_id |
    | 63383               |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate terms condition and privacy policy text
  Then I should see "termsConditionText" containing "By clicking the 'Place Order and Pay' button, you are confirming that you have read, understood & accept our terms & conditions." on "paymentPage"
  And I should see "privacyPolicyText" as "I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions. View our Privacy Policy" on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card section
  Then I am in view of "beautyCardAccordion" on "paymentPage"
  And I click on "beautyCardAccordion" on "paymentPage"
  Then I should see "beautyCardApplyButton" exist on "paymentPage"
  And I should see "beautyCardPreID" as "<beauty_card_pre_id>" on "paymentPage"
  And I should see "beautyCardSaveCheckbox" exist on "paymentPage"
  And I should see "beautyCardPinField" exist on "paymentPage"
  And I should see "beautyCardIDField" exist on "paymentPage"

  Examples:
    | beauty_card_pre_id |
    | 633586             |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardIDError" as "Please enter a valid card number." on "paymentPage"
  And I should see "beautyCardPinError" as "Please enter your PIN." on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    |                    |                 |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardIDError" as "Your Reward ID must be 16 digits." on "paymentPage"

  Examples:
    | beauty_card_number |
    | 0000               |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for more than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardIDError" as "Your Reward ID must not exceed 16 digits." on "paymentPage"

  Examples:
    | beauty_card_number |
    | 00001111222233     |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin |
    | 0000111122         | 0000            |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card applied
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<beauty_card_number>" in "beautyCardIDField" on "paymentPage"
  And I enter "<beauty_card_pin>" in "beautyCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "beautyCardValue" as "<beauty_card_value>" on "paymentPage"
  When I click on "beautyCardApplyButton" on "paymentPage"
  Then I should see "beautyCardAppliedCard" containing "<beauty_card_ending>" on "paymentPage"
  And I should see "beautyCardAppliedValue" as "<beauty_card_value>" on "paymentPage"
  And I should see "beautyCardAppliedRemoveLink" exist on "paymentPage"
  And I should see "beautyCardAppliedText" as "Beauty Club card applied" on "paymentPage"

  Examples:
    | beauty_card_number | beauty_card_pin | beauty_card_ending | beauty_card_value |
    | 4917026678         | 4825            | 6678               | £1.00             |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "beautyClubCardPointApply" on "paymentPage"
  Then I should see "beautyClubCardPointIDError" as "Please enter a valid Points ID - this is the 14 digits following 63383." on "paymentPage"

  Examples:
    | beauty_card_point_number |
    |                          |
    | 0000                     |
    | 0000111122223333         |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point error with invalid number
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "beautyClubCardPointApply" on "paymentPage"
  Then I should see "errorMessage" as "Please enter a valid Beauty Card Points ID number, it looks like the current number is invalid" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | beauty_card_point_number |
    | 00001111222233           |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point applied with valid entry
  When I am in view of "beautyClubCardPointApply" on "paymentPage"
  And I enter "<beauty_card_point_number>" in "beautyClubCardPointIDField" on "paymentPage"
  And I click on "beautyClubCardPointApply" on "paymentPage"
  Then I should see "beautyClubCardPointIDApplied" containing "<beauty_card_point_ending_digit>" on "paymentPage"
  And I should see "beautyClubCardPointRemoveLink" exist on "paymentPage"

  Examples:
    | beauty_card_point_number | beauty_card_point_ending_digit |
    | 00500017751680           | 1680                           |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the removal of beauty club card point
  When I click on "beautyClubCardPointRemoveLink" on "paymentPage"
  Then I wait for "2000" milliseconds
  And I should see "beautyClubCardPointApply" exist on "paymentPage"
  And I should see "beautyClubCardPointPreID" as "<beauty_point_pre_id>" on "paymentPage"
  And I should see "beautyClubCardPointIDField" exist on "paymentPage"

  Examples:
    | beauty_point_pre_id |
    | 63383               |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the gift card section
  #When I am in view of "creditCardAccordion" on "paymentPage"
  And I click on "giftCardAccordion" on "paymentPage"
  Then I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Please enter your Gift card number." on "paymentPage"
  And I should see "giftCardPinError" as "Please enter a valid 4 digit PIN." on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin |
    |                  |               |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Your Gift card number must be at least 16 digits." on "paymentPage"

  Examples:
    | gift_card_number |
    | 0000             |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for more than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Your Gift card number must not exceed 16 digits." on "paymentPage"

  Examples:
    | gift_card_number   |
    | 000011112222333344 |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin |
    | 0000111122223333 | 0000          |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
  When I am in view of "beautyCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Sorry, there are insufficient funds on your Gift card. Please use an alternative payment method to pay for the order." on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value |
    | 6338309524892655 | 2243          | £12.75          |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the removal of beauty card
  When I am in view of "beautyCardAccordion" on "paymentPage"
  And I click on "beautyCardAppliedRemoveLink" on "paymentPage"
  And I wait for "3000" milliseconds
  Then I should see "beautyCardApplyButton" exist on "paymentPage"
  And I should see "beautyCardPreID" as "<beauty_card_pre_id>" on "paymentPage"
  And I should see "beautyCardSaveCheckbox" exist on "paymentPage"
  And I should see "beautyCardPinField" exist on "paymentPage"
  And I should see "beautyCardIDField" exist on "paymentPage"

  Examples:
    | beauty_card_pre_id |
    | 633586             |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCard1AppliedCard" containing "<gift_card_ending>" on "paymentPage"
  And I should see "giftCard1AppliedValue" as "<gift_card_value>" on "paymentPage"
  And I should see "giftCard1AppliedRemoveLink" exist on "paymentPage"
  And I should see "giftCard1AppliedText" as "Gift card applied" on "paymentPage"
  And I should see "giftCardAddAnotherCardLink" exist on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value | gift_card_ending |
    | 6338309524892655 | 2243          | £12.75          | 2655             |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the add another gift card
  When I click on "giftCardAddAnotherCardLink" on "paymentPage"
  Then I should see "giftCardAddAnotherText" as "Add another Gift card" on "paymentPage"
  And I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Sorry, there are insufficient funds on your Gift card. Please use an alternative payment method to pay for the order." on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value |
    | 6000019201003503 | 5842          | £22.25          |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the removal of gift card 1
  When I click on "giftCard1AppliedRemoveLink" on "paymentPage"
  And I wait for "3000" milliseconds
  Then I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I should not see "giftCardValue" on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the credit card section
  When I am in view of "termsConditionText" on "paymentPage"
  #And I "open" "creditCardAccordion" accordion on "paymentPage"
  Then I should see "creditCardIcons" exist on "paymentPage"
  And I should see "creditCardIDField" exist on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"

  Examples:
    | sec_num_digits_text  |
    | 3 digits on the back |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the credit card error message for empty fields
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_sec_num>" in "creditCardSecurityNumber" on "paymentPage"
  And I click on "creditCardExpiryMonth" on "paymentPage"
  And I click on "creditCardExpiryYear" on "paymentPage"
  Then I should see "creditCardIDError" as "Please enter your card number." on "paymentPage"
  And I should see "creditCardExpiryDateError" as "Please enter the expiry date of your payment card." on "paymentPage"
  And I should see "creditCardSecurityNumError" as "Please enter a valid security number." on "paymentPage"

  Examples:
    | credit_card_number | credit_card_sec_num |
    |                    |                     |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the credit card error message for less than 16 digits
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_sec_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I should see "creditCardIDError" as "Card number must be more than 15 digits." on "paymentPage"

  Examples:
    | credit_card_number | credit_card_sec_num |
    | 41111              |                     |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the visa credit card icon
  When I am in view of "termsConditionText" on "paymentPage"
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

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the amex credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type        | sec_num_digits_text   | cc_number         |
    | 378282246310005    | american-express | 4 digits on the front | 3782 822463 10005 |

@automated @DBMTE-74 @DBMTE-76
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

@automated @DBMTE-74 @DBMTE-76
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

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the jcb credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  And I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 3530111333300000   | JCB       | 3 digits on the back | 3530 1113 3330 0000 |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the store card icon
  When I enter "<store_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should not see "creditCardExpiryMonth" on "paymentPage"
  And I should not see "creditCardExpiryYear" on "paymentPage"
  And I should not see "creditCardSecurityNumber" on "paymentPage"
  And I should not see "creditCardDigitsText" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | store_card_number | icon_type | cc_number           |
    | 6335864917026678  | debenhams | 6335 8649 1702 6678 |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the billing address section
  When I am in view of "termsConditionText" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  #And I should see "savedAddressText" as "Same as delivery address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I should see "titleMrs" exist on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "countryGB" exist on "paymentPage"
  And I should see "houseNumberField" exist on "paymentPage"
  And I should see "postcodeField" exist on "paymentPage"
  And I should see "findAddressButton" exist on "paymentPage"
  And I should see "enterAddressManuallyLink" exist on "paymentPage"
  And I should see "bfpoLink" exist on "paymentPage"
  And I should not see "addressOne" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "findAnotherAddressLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the billing address errors for empty fields
  When I click on "titleMrs" on "paymentPage"
  And I click on "countryGB" on "paymentPage"
  And I enter "<first_name>" in "firstNameField" on "paymentPage"
  And I enter "<last_name>" in "lastNameField" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumberField" on "paymentPage"
  And I enter "<postcode>" in "postcodeField" on "paymentPage"
  And I click on "findAddressButton" on "paymentPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "paymentPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "paymentPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "paymentPage"
  When I am in view of "placeOrderButton" on "paymentPage"
  Then I should see "postcodeError" as "Please enter your postcode." on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | postcode |
    |            |           |              |          |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the billing address lookup
  When I am in view of "placeOrderButton" on "paymentPage"
  Then I should see "findAddressButton" exist on "paymentPage"
  When I click on "titleMrs" on "paymentPage"
  And I click on "countryGB" on "paymentPage"
  And I enter "<first_name>" in "firstNameField" on "paymentPage"
  And I enter "<last_name>" in "lastNameField" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumberField" on "paymentPage"
  And I enter "<house_number>" in "houseNumberField" on "paymentPage"
  And I enter "<postcode>" in "postcodeField" on "paymentPage"
  And I click on "findAddressButton" on "paymentPage"
  Then I should see "addressOne" as "<address>" on "paymentPage"
  And I should see "useAddressButton" exist on "paymentPage"
  And I should see "cantFindAddressLink" exist on "paymentPage"
  And I should see "findAnotherAddressLink" exist on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "postcodeField" on "paymentPage"
  And I should not see "houseNumberField" on "paymentPage"
  And I should not see "countryGB" on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | address                                 |
    | Test       | User      | 9876543210   | 1            | E16FQ    | Flat 1, 4 Steward Street, LONDON E1 6FQ |

@automated @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the bfpo and find another address link
  When I click on "cantFindAddressLink" on "paymentPage"
  And I should see "useAddressButton" exist on "paymentPage"
  And I should see "bfpoLink" exist on "paymentPage"
  And I should see "searchPostcodeLink" exist on "paymentPage"
  When I am in view of "placeOrderButton" on "paymentPage"
  And I wait for "2000" milliseconds
  And I click on "bfpoLink" on "paymentPage"
  Then I should see "bfpoHeaderText" as "BFPO address format" on "paymentPage"
  And I should see "bfpoCloseIcon" exist on "paymentPage"
  And I should see "bfpoCloseButton" exist on "paymentPage"

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the search by postcode link and validate the above filled house number and postcode retention
  When I click on "bfpoCloseButton" on "paymentPage"
  And I click on "searchPostcodeLink" on "paymentPage"
  Then I should see value of "houseNumberField" as "<house_number>" on "paymentPage"
  And I should see value of "postcodeField" as "<postcode>" on "paymentPage"
  And I should see "findAddressButton" exist on "paymentPage"
  And I should see "bfpoLink" exist on "paymentPage"
  And I should see "enterAddressManuallyLink" exist on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"

  Examples:
    | house_number | postcode |
    | 1            | E16FQ    |

@automated @DBMTE-74 @DBMTE-76
Scenario Outline: Navigate to Debenhams payment page and validate the use address with valid details
  When I click on "titleMrs" on "paymentPage"
  And I click on "countryGB" on "paymentPage"
  And I enter "<first_name>" in "firstNameField" on "paymentPage"
  And I enter "<last_name>" in "lastNameField" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumberField" on "paymentPage"
  And I enter "<house_number>" in "houseNumberField" on "paymentPage"
  And I enter "<postcode>" in "postcodeField" on "paymentPage"
  And I am in view of "placeOrderButton" on "paymentPage"
  And I click on "findAddressButton" on "paymentPage"
  Then I should see "addressOne" as "<address>" on "paymentPage"
  When I click on "useAddressButton" on "paymentPage"
  #Then I should see "editAddressLink" exist on "paymentPage"
  #And I should see "addNewAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | address                                 |
    | Test       | User      | 9876543210   | 1            | E16FQ    | Flat 1, 4 Steward Street, LONDON E1 6FQ |

@manual @DBMTE-159
Scenario: Navigate to Debenhams payment page and that place order and pay are sticky on the payment page

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and the total items under order summary (should be same as my bag)

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and the subtotal under order summary (should be same as my bag)

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and the price against total items under order summary (should be same as my bag)

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and the price against total product discount under order summary (should be same as my bag)

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and the price against total discount under order summary (should be same as my bag)

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify dress and perfume products appear under it

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify standard delivery type & estimation days to appear when user selected standard delivery in checkout journey

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify next nominated delivery type & estimation days to appear when user selected next nominated delivery in checkout journey

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify international delivery type & estimation days to appear when user selected international delivery in checkout journey

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify click & collect delivery type & estimation days to appear when user selected click & collect delivery in checkout journey

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify low in stock and out of stock messages against the product

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify product can be removed when in out of stock

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify user navigates back to delivery options page when selected change delivery option and able to change delivery option in payement page

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page order summary section and verify user can edit its shopping bag by selecting edit link and updated product list should appear in payment page

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate user can add or remove promo code which should be update the price section accordingly

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate the price summary section as per the delivery charges which gets applied

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate user should be able to check uncheck the receive email newsletter information

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using one gift card only

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using two gift card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using beauty card only

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using beauty card and gift card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate insufficient payment error when trying with 2 gift card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate insufficient payment error when trying with beauty and gift card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate remaining balance in gift card when fulfilment

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate remaining balance in beauty card when fulfilment

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate saved beauty card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate saved credit card

@manual @DBMTE-74 @DBMTE-76
Scenario: Navigate to Debenhams payment page and validate expired credit card can be removed

@manual @DBMTE-
Scenario: Validate expired credit card should have remove link below

@manual @DBMTE-
Scenario: Validate standard delivery is displayed on payment page when user select standard delivery option

@manual @DBMTE-
Scenario: Validate next nominated delivery is displayed on payment page when user select next nominated delivery option

@manual @DBMTE-
Scenario: Validate next day delivery is displayed on payment page when user select next day delivery option

@manual @DBMTE-
Scenario: Validate C&C delivery is displayed on payment page when user select C&C delivery option

@manual @DBMTE-
Scenario: Validate international delivery is displayed on payment page when user select international delivery option

@manual @DBMTE-
Scenario: Validate promo code section when PS01 applied

@manual @DBMTE-
Scenario: Validate promo code section when both PS01 & BR01 applied, only one of them can be applied

@manual @DBMTE-
Scenario: Validate promo code section with inline error on empty field

@manual @DBMTE-
Scenario: Validate promo code section with error message on duplicate promo code

@manual @DBMTE-
Scenario: Validate promo code section with error message on invalid promo code

@manual @DBMTE-
Scenario: Validate billing address with inline error messaging

@manual @DBMTE-
Scenario: Validate billing address postcode lookup values coming correct

@manual @DBMTE-113
Scenario: Navigate to Debenhams payment page and validate out of stock product message and link to remove it

@manual @DBMTE-113
Scenario: Navigate to Debenhams payment page and validate removing of out of stock product (if only one product in order summay then user navigates to empty my bag)

@manual @DBMTE-113
Scenario: Navigate to Debenhams payment page and validate removing of out of stock product (if more than one product in order summay then user navigates stays on payment page with remaining products)

@manual @DBMTE-113
Scenario: Navigate to Debenhams payment page and validate low in stock product message

@manual @DBNHST-2284
Scenario: Navigate to Debenhams payment page and validate that user is able to see the Secure checkout copy on the header below the Debenhams logo
	Given I am on the tablet payment page
	Then I will see secure checkout copy under the Debenhams logo
	And I should verify the different componets of payment page like GC, PC, Beauty card, Beauty Id, Creadit card, etc.
	When I click on Debenehams logo on payment page
	Then I should be taken to Debenhams home page

@manual @DBNHST-2283
Scenario: Navigate to Debenhams payment page and validate that change delivery method link is at correct position and correct size
	Given I am on the tablet payment page
	Then I should see the updated size and position of change delivery method link
	When I press the change delivery method link
	Then I am taken back to the home vs click & collect page
	Then I change the delivery method and navigate to payment page
	Then I should see the updated size and position of change delivery method link

@manual @DBNHST-2283
Scenario: Navigate to Debenhams payment page and validate that edit shopping bag link is at correct position and correct size
	Given I am on the tablet payment page
	Then I should see the updated size and position of edit shopping bag link
	When I press the edit shopping bag link
	Then I am taken back to the bag page
	Then I add/remove products in my bag and navigate to payment page
	Then I should see the updated size and position of edit shopping bag link

@manual @DBNHST-2283 @DBNHST-2284
Scenario: Navigate to Debenhams payment page and validate terms condition and privacy policy url are working
    Given I am on the tablet payment page
	Then I should see the terms condition and privacy policy text below the place order button
    Then I should validate the terms condition and privacy policy url is working place order button

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
