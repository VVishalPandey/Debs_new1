Feature: Test Debenhams Dotie payment page

@manual @DBMTE-631
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
  And I should see "rewardCardAccordion" as "Pay with a Beauty Club card" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@manual @DBMTE-631
Scenario: Validate payment chevron is highlighted
  Then I should see payment chevron highlighted

@manual @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate debenhams club card points
  Then I should see "creditCardPointText" containing "Points by paying with your Debenhams Credit Card." on "paymentPage"
  And I validate "credit card points" value from mybag

@manual @DBMTE-631
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

@manual @DBMTE-611
Scenario: Navigate to Debenhams payment page and validate debenhams beauty club card points
  Then I am in view of "rewardClubCardPointText" on "paymentPage"
  Then I should see "rewardClubCardPointText" containing "points on your Beauty Club Card" on "paymentPage"
  And I validate "reward card points" value from mybag

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate debenhams beauty club card points section
  Then I should see "rewardClubCardPointApply" exist on "paymentPage"
  And I should see "rewardClubCardPointPreID" as "<reward_point_pre_id>" on "paymentPage"
  And I should see "rewardClubCardPointIDField" exist on "paymentPage"

  Examples:
    | reward_point_pre_id |
    | 63383               |

@manual @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate terms condition and privacy policy text
  Then I should see "termsConditionText" containing "By clicking the 'Place Order and Pay' button, you are confirming that you have read, understood & accept our terms & conditions." on "paymentPage"
  And I should see "privacyPolicyText" as "I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions. View our Privacy Policy" on "paymentPage"

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card section
  Then I am in view of "rewardCardAccordion" on "paymentPage"
  And I click on "rewardCardAccordion" on "paymentPage"
  Then I should see "rewardCardApplyButton" exist on "paymentPage"
  And I should see "rewardCardPreID" as "<reward_card_pre_id>" on "paymentPage"
  And I should see "rewardCardSaveCheckbox" exist on "paymentPage"
  And I should see "rewardCardPinField" exist on "paymentPage"
  And I should see "rewardCardIDField" exist on "paymentPage"

  Examples:
    | reward_card_pre_id |
    | 633586             |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for empty fields
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardIDError" as "Please enter a valid card number." on "paymentPage"
  And I should see "rewardCardPinError" as "Please enter your PIN." on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin |
    |                    |                 |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardIDError" as "Your Reward ID must be 16 digits." on "paymentPage"

  Examples:
    | reward_card_number |
    | 0000               |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for more than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardIDError" as "Your Reward ID must be 16 digits." on "paymentPage"

  Examples:
    | reward_card_number |
    | 000011112          |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card error message for incorrect card details
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  And I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin |
    | 0000111122         | 0000            |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card applied
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<reward_card_number>" in "rewardCardIDField" on "paymentPage"
  And I enter "<reward_card_pin>" in "rewardCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "rewardCardValue" as "<reward_card_value>" on "paymentPage"
  When I click on "rewardCardApplyButton" on "paymentPage"
  Then I should see "rewardCardAppliedCard" containing "<reward_card_ending>" on "paymentPage"
  And I should see "rewardCardAppliedValue" as "<reward_card_value>" on "paymentPage"
  And I should see "rewardCardAppliedRemoveLink" exist on "paymentPage"
  And I should see "rewardCardAppliedText" as "Reward Club Card applied" on "paymentPage"

  Examples:
    | reward_card_number | reward_card_pin | reward_card_ending | reward_card_value |
    | 5839632428         | 9040            | 2428               | € 96.21           |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point error with incomplete digits
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "rewardClubCardPointApply" on "paymentPage"
  Then I should see "rewardClubCardPointIDError" as "Please enter a valid Points ID - this is the 14 digits following 63383." on "paymentPage"

  Examples:
    | reward_card_point_number |
    |                          |
    | 0000                     |
    | 0000111122223            |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point error with invalid number
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "rewardClubCardPointApply" on "paymentPage"
  Then I should see "errorMessage" as "Please enter a valid Reward Card Points ID number, it looks like the current number is invalid" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | reward_card_point_number |
    | 00001111222233           |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the beauty club card point applied with valid entry
  When I am in view of "rewardClubCardPointApply" on "paymentPage"
  And I enter "<reward_card_point_number>" in "rewardClubCardPointIDField" on "paymentPage"
  And I click on "rewardClubCardPointApply" on "paymentPage"
  Then I should see "rewardClubCardPointIDApplied" containing "<reward_card_point_ending_digit>" on "paymentPage"
  And I should see "rewardClubCardPointRemoveLink" exist on "paymentPage"

  Examples:
    | reward_card_point_number | reward_card_point_ending_digit |
    | 00200039632428           | 2428                           |

@manual @DBMTE-611
Scenario Outline: Navigate to Debenhams payment page and validate the removal of beauty club card point
  When I click on "rewardClubCardPointRemoveLink" on "paymentPage"
  Then I wait for "2000" milliseconds
  And I should see "rewardClubCardPointApply" exist on "paymentPage"
  And I should see "rewardClubCardPointPreID" as "<reward_point_pre_id>" on "paymentPage"
  And I should see "rewardClubCardPointIDField" exist on "paymentPage"

  Examples:
    | reward_point_pre_id |
    | 63383               |

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the gift card section
  #When I am in view of "creditCardAccordion" on "paymentPage"
  And I click on "giftCardAccordion" on "paymentPage"
  Then I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the gift card error message for less than 16 digits
  When I am in view of "creditCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "giftCardIDError" as "Your Gift card number must be at least 16 digits." on "paymentPage"

  Examples:
    | gift_card_number |
    | 0000             |

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
  When I am in view of "rewardCardAccordion" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"
  Then I should see "errorMessage" as "Sorry, there are insufficient funds on your Gift card. Please use an alternative payment method to pay for the order." on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value |
    | 6335865090823955 | 7414          | € 1.00          |

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the removal of beauty card
  When I am in view of "rewardCardAccordion" on "paymentPage"
  And I click on "rewardCardAppliedRemoveLink" on "paymentPage"
  And I wait for "3000" milliseconds
  Then I should see "rewardCardApplyButton" exist on "paymentPage"
  And I should see "rewardCardPreID" as "<reward_card_pre_id>" on "paymentPage"
  And I should see "rewardCardSaveCheckbox" exist on "paymentPage"
  And I should see "rewardCardPinField" exist on "paymentPage"
  And I should see "rewardCardIDField" exist on "paymentPage"

  Examples:
    | reward_card_pre_id |
    | 633586             |

@manual @DBMTE-611 @DBMTE-631
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
    | 6335865090823955 | 7414          | € 1.00          | 3955             |

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the add another gift card
  When I click on "giftCardAddAnotherCardLink" on "paymentPage"
  Then I should see "giftCardAddAnotherText" as "Add another Gift card" on "paymentPage"
  And I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"

@manual @DBMTE-611 @DBMTE-631
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
    | 6335865081887373 | 8773          | £373.99         |

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the removal of gift card 1
  When I click on "giftCard1AppliedRemoveLink" on "paymentPage"
  And I wait for "3000" milliseconds
  Then I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"
  And I should not see "giftCardValue" on "paymentPage"

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the credit card error message for less than 16 digits
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I enter "<credit_card_sec_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I should see "creditCardIDError" as "Card number must be more than 15 digits." on "paymentPage"

  Examples:
    | credit_card_number | credit_card_sec_num |
    | 41111              |                     |

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the jcb credit card icon
  When I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  And I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"
  And I click on "errorMessageClose" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           |
    | 3530111333300000   | JCB       | 3 digits on the back | 3530 1113 3330 0000 |

@manual @DBMTE-611 @DBMTE-631
Scenario Outline: Navigate to Debenhams payment page and validate the store card icon
  When I enter "<store_card_number>" in "creditCardIDField" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
  And I should see "errorMessage" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | store_card_number | icon_type | cc_number           |
    | 6335864917026678  | debenhams | 6335 8649 1702 6678 |

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
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

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the billing address section when selected add new address (ROI country to be selected by default)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the billing address section by adding to a new address

@manual @DBMTE-159
Scenario: Navigate to Debenhams payment page and that place order and pay are sticky on the payment page

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and the total items under order summary (should be same as my bag)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and the subtotal under order summary (should be same as my bag)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and the price against total items under order summary (should be same as my bag)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and the price against total product discount under order summary (should be same as my bag)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and the price against total discount under order summary (should be same as my bag)

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify standard delivery type & estimation days to appear when user selected standard delivery in checkout journey

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify next nominated delivery type & estimation days to appear when user selected next nominated delivery in checkout journey

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify international delivery type & estimation days to appear when user selected international delivery in checkout journey

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify click & collect delivery type & estimation days to appear when user selected click & collect delivery in checkout journey

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify low in stock and out of stock messages against the product

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify product can be removed when in out of stock

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify user navigates back to delivery options page when selected change delivery option and able to change delivery option in payement page

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page order summary section and verify user can edit its shopping bag by selecting edit link and updated product list should appear in payment page

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate user can add or remove promo code which should be update the price section accordingly

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate the price summary section as per the delivery charges which gets applied

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate user should be able to check uncheck the receive email newsletter information

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using one gift card only

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using two gift card

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using beauty card only

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate payment fulfillment using beauty card and gift card

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate insufficient payment error when trying with 2 gift card

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate insufficient payment error when trying with beauty and gift card

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate remaining balance in gift card when fulfilment

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate remaining balance in beauty card when fulfilment

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate saved beauty card

@manual @DBMTE-611 @DBMTE-631
Scenario: Navigate to Debenhams payment page and validate saved credit card

@manual @DBMTE-611 @DBMTE-631
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
