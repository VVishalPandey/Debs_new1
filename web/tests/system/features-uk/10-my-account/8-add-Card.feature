Feature: Test Add a new Payment card scenarios

@automated @DBNHST-1105
Scenario Outline: Validate My account - Payment page setup
  Given I logout
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  When I click on "menuIcon" on "commonPage"
  And I should see value of position "14" as "Create Account/Sign In"
  When I click on "signInOptionUK" on "commonPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  Then I click on "myPaymentCardsButton" on "myDetailsPage"
  And I should see "header" as "My payment cards" on "paymentPage"
  And I should see "backButton" exist on "paymentPage"
  And I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"

  Examples:
    | email              | password |
    | debsops3@gmail.com | debs1234 |

@automated  @DBNHST-1105
Scenario: Validate My account - Add new Payment card page setup
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  And I should see "subHeading" as "Add a new payment card" on "paymentPage"
  And I should see "cardTypeSection" as "Card details" on "paymentPage"
  And I should see "selectCardTypeDropDown" exist on "paymentPage"
  And I should see "billingAddressDetailSection" as "Billing address" on "paymentPage"
  And I should see "selectSavedAddressDropDown" exist on "paymentPage"
  And I should see "title" exist on "paymentPage"
  And I should see "firstName" exist on "paymentPage"
  And I should see "lastName" exist on "paymentPage"
  And I should see "phoneNumber" exist on "paymentPage"
  And I should see "countryDropDown" exist on "paymentPage"
  And I should see "houseNumber" exist on "paymentPage"
  And I should see "postCode" exist on "paymentPage"
  And I should see "enterAddManuallyLink" exist on "paymentPage"
  And I should see "findAddButton" exist on "paymentPage"
  And I should see "cancelButton" exist on "paymentPage"
  And I should see "savePaymentCardButton" exist on "paymentPage"

#######################Beauty card ###################

@automated @DBNHST-1105
Scenario: Validate My account - Add Beauty card details on New payment card page
  When I click on "selectBeautyCard" on "paymentPage"
  Then I should see "cardNumberInputBox" exist on "paymentPage"

@automated @DBNHST-
Scenario Outline: Validate the beauty card error message for less than 16 digits on Add new payment page
  Then I enter "<beauty_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedBillingAddress" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  #Then I should see "giftCardIDError" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | beauty_card_number |
    | 0000               |

@automated @DBNHST-
Scenario Outline: Validate the beauty card error message for incorrect card number on Add new payment page
  Then I enter "<beauty_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedBillingAddress" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  #Then I should see "giftCardIDError" as "The payment card number does not belong to the payment method." on "paymentPage"

  Examples:
    | beauty_card_number |
    | 0000111122224444   |

@automated @DBNHST-
Scenario Outline: Validate correct beauty card is added with already saved address to My payment page
  Then I enter "<beauty_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedBillingAddress" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should not see "findAddressButton1" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  Then I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"
  Examples:
    | beauty_card_number |
    | 6335864917026678   |

#######################Gift card ###################

@automated @DBNHST-1105
Scenario: Validate My account - Add Gift card details on New payment card page
  When I click on "debTitle" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I click on "MyAccountUK" on "commonPage"
  And  I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  When I click on "selectGiftCard" on "paymentPage"
  Then I should see "cardNumberInputBox" exist on "paymentPage"

@automated @DBNHST-
Scenario Outline: Validate the gift card error message for less than 16 digits on Add new payment page
  Then I enter "<gift_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedBillingAddress" on "paymentPage"
  And I click on "savesPaymentCardButton" on "paymentPage"
  #Then I should see "giftCardIDError" as "Invalid card number - please try again" on "paymentPage"

  Examples:
    | gift_card_number |
    | 0000             |

@automated @DBNHST-
Scenario Outline: Validate the gift card error message for incorrect card number on Add new payment page
  Then I enter "<gift_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedAddress" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  #Then I should see "giftCardIDError" as "The payment card number does not belong to the payment method." on "paymentPage"

  Examples:
    | gift_card_number |
    | 0000111122224444 |

@automated @DBNHST-
Scenario Outline: Validate correct gift card is added with already saved address to My payment page
  Then I enter "<gift_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I click on "chooseFirstSavedBillingAddress" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should not see "findAddressButton1" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  Then I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"
  Examples:
    | gift_card_number |
    | 6338309524892655 |

@automated @DBNHST-
Scenario Outline: Validate correct gift card is added with new billing address to My payment page
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  When I click on "selectGiftCard" on "paymentPage"
  And I enter "<gift_card_number>" in "cardNumberInputBox" on "paymentPage"
  And I wait for "2000" milliseconds
  And I enter "<first_Name>" in "firstName" on "paymentPage"
  And I enter "<last_Name>" in "lastName" on "paymentPage"
  And I enter "<phone_Number>" in "phoneNumber" on "paymentPage"
  And I enter "<house_Number>" in "houseNumber" on "paymentPage"
  And I enter "<post_Code>" in "postCode" on "paymentPage"
  Then I click on "findAddButton" on "paymentPage"
  Then I should not see "findAddButton" on "paymentPage"
  And I click on "savePaymentCardButton" on "paymentPage"
  Then I should see "addNewPaymentCardLink" exist on "paymentPage"
  And I should see "existingCardDetails" exist on "paymentPage"

  Examples:
    | gift_card_number | first_Name | last_Name | phone_Number | house_Number | post_Code |
    | 6338309524892655 | test       | name      | 69887687686  | 8            | E16DU     |


####################################################################################

#######################Credit card ###################

@automated @DBNHST-1105
Scenario: Validate My account - Add Credit/Debit card details on New payment card page
  When I click on "debTitle" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I click on "MyAccountUK" on "commonPage"
  And I wait for "2000" milliseconds
  And  I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  When I click on "selectCreditCard" on "paymentPage"
  Then I should see "cardNumberInputBox" exist on "paymentPage"
  And I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"

@automated @DBNHST-
Scenario Outline: Validate the visa credit card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type |
    | 4111111111111111   | visa      |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the amex credit card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type        |
    | 378282246310005    | american-express |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type  |
    | 5555555555554444   | mastercard |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the master credit card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type |
    | 6759270000000000   | maestro   |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the jcb credit card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "creditCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | credit_card_number | icon_type |
    | 3530111333300000   | JCB       |

#####################Store card ################################################
@automated @DBNHST-1105
Scenario: Validate My account - Add Store card details on New payment card page
  When I click on "selectStoreCard" on "paymentPage"
  Then I should see "cardNumberInputBox" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "storeCardExpireYear" exist on "paymentPage"
  And I should not see "issueNumber" on "paymentPage"
  And I should not see "nameOnCard" on "paymentPage"

@manual @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the store card icon
  When I enter "<credit_card_number>" in "cardNumberInputBox" on "paymentPage"
  Then I should see "creditCardStartMonth" exist on "paymentPage"
  And I should see "creditCardStartYear" exist on "paymentPage"
  And I should see "creditCardExpireMonth" exist on "paymentPage"
  And I should see "storeCardExpireYear" exist on "paymentPage"
  And I should see "issueNumber" exist on "paymentPage"
  And I should see "nameOnCard" exist on "paymentPage"
  #And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"

  Examples:
    | store_card_number | icon_type |
    | 6335864917026678  | debenhams |

##############################################################################################

#############Billing address ################################################################

@automated @DBNHST-
Scenario: Validate the billing address section
  Then I should see "billingAddressDetailSection" as "Billing address" on "paymentPage"
  And I should see "selectSavedAddressDropDown" exist on "paymentPage"
  Then I should see "title" exist on "paymentPage"
  And I should see "firstName" exist on "paymentPage"
  And I should see "lastName" exist on "paymentPage"
  And I should see "phoneNumber" exist on "paymentPage"
  And I should see "countryDropDown" exist on "paymentPage"
  And I should see "houseNumber" exist on "paymentPage"
  And I should see "postCode" exist on "paymentPage"
  And I should see "findAddButton" exist on "paymentPage"
  And I should see "enterAddManuallyLink" exist on "paymentPage"
  And I should not see "findAnotherAddressLink" on "paymentPage"
  And I should see "cancelButton" exist on "paymentPage"
  And I should see "savePaymentCardButton" exist on "paymentPage"

@automated @DBNHST-
Scenario: Validate the billing address errors for empty fields
  When I click on "title" on "paymentPage"
  And I enter "<first_name>" in "firstName" on "paymentPage"
  And I enter "<last_name>" in "lastName" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumber" on "paymentPage"
  And I enter "<house_number>" in "houseNumber" on "paymentPage"
  And I enter "<postcode>" in "postCode" on "paymentPage"
  And I click on "findAddButton" on "paymentPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "paymentPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "paymentPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "paymentPage"
  Then I should see "postcodeError" as "Please enter your postcode." on "paymentPage"
  Then I should see "houseNumberError" as "The address field cannot be empty" on "paymentPage"

@automated @DBNHST-
Scenario Outline: Validate the billing address lookup for single address postcode
  Then I should see "findAddButton" exist on "paymentPage"
  When I click on "debTitle" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  Then I click on "MyAccountUK" on "commonPage"
  And I wait for "2000" milliseconds
  And  I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I click on "addNewPaymentCardLink" on "paymentPage"
  When I click on "selectCreditCard" on "paymentPage"
  #When I click on "title" on "paymentPage"
  And I enter "<first_name>" in "firstName" on "paymentPage"
  And I enter "<last_name>" in "lastName" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumber" on "paymentPage"
  And I enter "<house_number>" in "houseNumber" on "paymentPage"
  And I enter "<postcode>" in "postCode" on "paymentPage"
  And I click on "findAddButton" on "paymentPage"
  Then I should see "addressOne" as "<address>" on "paymentPage"
  And I should see "findAnotherAddressLink" exist on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | address                                 |
    | Test       | User      | 9876543210   | 1            | E16FQ    | Flat 1, 4 Steward Street, LONDON E1 6FQ |

@automated @DBNHST-
Scenario Outline: Validate the billing address lookup for multi address postcode
  Then I click on "findAddButton" on "paymentPage"
  Then I should see "findAddButton" exist on "paymentPage"
  When I click on "title" on "paymentPage"
  And I enter "<first_name>" in "firstName" on "paymentPage"
  And I enter "<last_name>" in "lastName" on "paymentPage"
  And I enter "<phone_number>" in "phoneNumber" on "paymentPage"
  And I enter "<house_number>" in "houseNumber" on "paymentPage"
  And I enter "<postcode>" in "postCode" on "paymentPage"
  And I click on "findAddButton" on "paymentPage"
  And I should see "multiAddressDropDown" exist on "paymentPage"
  And I should see "findAnotherAddressLink" exist on "paymentPage"

  Examples:
    | first_name | last_name | phone_number | house_number | postcode | address                                 |
    | Test       | User      | 9876543210   | 10           | IG12FS   | Flat 1, 4 Steward Street, LONDON E1 6FQ |
