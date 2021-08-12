Feature: Test Debenhams home delivery new address page

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page as guest and validate the page
  #Given I navigate to delivery option as guest
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery option as guest
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcode" exist on "homeDeliveryPage"
  And I should see "findYourAddressButton" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should not see "useThisAddressButton" on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page as guest and validate the house number and postcode error message for empty field
  When I click on "findYourAddressButton" on "homeDeliveryPage"
  #Then I should see "postcodeError" as "The Postal code/ZIP code field cannot be empty." on "homeDeliveryPage"
  Then I should see "postcodeError" as "Please enter your postcode." on "homeDeliveryPage"
  And I should see "houseNumberError" as "The address field cannot be empty" on "homeDeliveryPage"
# And I should not see "firstNameError" on "homeDeliveryPage"
# And I should not see "lastNameError" on "homeDeliveryPage"

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page as guest and validate the error message with incorrect postcode and house number
  When I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  #And I wait for "4000" milliseconds
  Then I should see "errorMessage" as "Please enter a valid postcode." on "homeDeliveryPage"
  # And I should not see "firstNameError" on "homeDeliveryPage"
  # And I should not see "lastNameError" on "homeDeliveryPage"

  Examples:
    | houseNumber | postcode |
    | ABCDE1234   | 1234567  |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page as guest and validate the error message with correct postcode and invalid house number
  When I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  And I wait for "4000" milliseconds
  Then I should see "errorMessage" as "There has been a problem finding your address. Please enter your address manually." on "homeDeliveryPage"
  # And I should not see "firstNameError" on "homeDeliveryPage"
  # And I should not see "lastNameError" on "homeDeliveryPage"

  Examples:
    | houseNumber | postcode |
    | ABCDE1234   | NW12FG   |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page from above and validate form with correct postcode and incorrect house number and inline error message when selected use this address
  When I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see "address" exist on "homeDeliveryPage"
  # And I should not see "firstNameError" on "homeDeliveryPage"
  # And I should not see "lastNameError" on "homeDeliveryPage"
  And I should see "addressSelectDebenhams" exist on "homeDeliveryPage"
  When I click on "addressSelectDebenhams" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

  Examples:
    | houseNumber | postcode |
    | 10          | NW12FG   |

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page from above and validate the page when selected enter address manually link
  When I click on "findAnotherAddressLink" on "homeDeliveryPage"
  And I click on "enterAddressManuallyLink" on "homeDeliveryPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcodeManual" exist on "homeDeliveryPage"
  And I should see "addressLine1" exist on "homeDeliveryPage"
  And I should see "addressLine2" exist on "homeDeliveryPage"
  And I should see "city" exist on "homeDeliveryPage"
  And I should see "county" exist on "homeDeliveryPage"
  And I should see "findAnotherAddressLink" exist on "homeDeliveryPage"
  And I should see "bfpoLink" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
  And I should not see "enterAddressManuallyLink" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page from above and validate the page when selected enter address manually link
  When I click on "bfpoLink" on "homeDeliveryPage"
  Then I should see "bfpoHeaderText" as "BFPO address format" on "homeDeliveryPage"
  And I should see "bfpoPara1Text" as "It is important that all mail sent through the BFPO system is addressed correctly to ensure a smooth delivery to its destination address." on "homeDeliveryPage"
  And I should see "bfpoPara2Text" as "The following information is provided as a guide when addressing mail to BFPO locations including Exercise & Operation:" on "homeDeliveryPage"
  And I should see "bfpoCloseLink" exist on "homeDeliveryPage"
  And I should see "bfpoCloseButton" exist on "homeDeliveryPage"
  And I click on "bfpoCloseButton" on "homeDeliveryPage"

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page from above and validate the inline error message fir empty fields when selected use this address
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"
  And I should see "houseNumberError" as "The address field cannot be empty." on "homeDeliveryPage"
  And I should see "cityError" as "The town/city field cannot be empty." on "homeDeliveryPage"

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page from above and validate the error message for incorrect postcode
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "errorMessage" as "Please enter a valid postcode." on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | city   | postcode |
    | Test2     | User2    | 9876543210  | ABCDE1234   | London | 1234567  |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page from above and check functionality for use this address by filling rest of details when selected find another address
  When I click on "findAnotherAddressLink" on "homeDeliveryPage"
  Then I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see "address" exist on "homeDeliveryPage"
  And I should see "addressSelectDebenhams" exist on "homeDeliveryPage"
  When I click on "addressSelectDebenhams" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should not see "firstName" on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should not see "phoneNumber" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode |
    | Test1     | User1    | 9876543210  | 10          | NW13FG   |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page as guest and validate the address is pre filled when user selected use this address with correct details
  #Given I navigate to delivery option as guest
  Given I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I click on "checkoutButton" on "myBagPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see value of "houseNumber" as "<houseNoPreFill>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressL1PreFill>" on "homeDeliveryPage"
  And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode1>" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode | houseNoPreFill    | addressL1PreFill | country | city   | postcode1 |
    | Test3     | User3    | 9876543210  | 11          | E14BA    | 11 Anchor Terrace | Cephas Avenue    | GB      | LONDON | E1 4BA    |

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery page from above scenario and validate once user selects use this address
  When I click on "useThisAddressButton" on "deliveryOptionPage"
  Then I should not see "firstName" on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should not see "phoneNumber " on "homeDeliveryPage"

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery address page as guest and validate the address is use when details entered manually
  Given I navigate to delivery option as guest
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I click on "enterAddressManuallyLink" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should not see "firstName" on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should not see "phoneNumber" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | city   | postcode |
    | Test4     | User4    | 9876543210  | 10ABC       | London | NW13FG   |

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery address page as guest and validate the page for country Australia
  Given I navigate to delivery option as guest
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  When I click on "countrySelectAustralia" on "homeDeliveryPage"
  Then I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "addressLine1" exist on "homeDeliveryPage"
  And I should see "addressLine2" exist on "homeDeliveryPage"
  And I should see "city" exist on "homeDeliveryPage"
  And I should see "county" exist on "homeDeliveryPage"
  And I should see "postcodeManual" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should see "bfpoLink" exist on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "enterAddressManuallyLink" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"

@automated @DBNHST-
Scenario: Navigate to Debenhams home delivery page from above scenario and validate inline error messages for empty fields when selected use this address
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"
  And I should see "houseNumberError" as "The address field cannot be empty." on "homeDeliveryPage"
  And I should see "cityError" as "The town/city field cannot be empty." on "homeDeliveryPage"
  And I should see "postcodeManualError" as "The Postal code/ZIP code field cannot be empty." on "homeDeliveryPage"

@manual @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery page from above scenario and validate error in case of incorrect postcode
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "postcodeManualError" as "Please enter a valid Australian postcode." on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | city   | postcode |
    | Test5     | User5    | 9876543210  | 10ABC       | London | ABCD     |
    | Test7     | User7    | 9876543210  | 10ABC       | London | A111     |
    | Test8     | User8    | 9876543210  | 10ABC       | London | 111A     |
    | Test7     | User7    | 9876543210  | 10ABC       | London | 11       |
    | Test8     | User8    | 9876543210  | 10ABC       | London | 11111    |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams home delivery page from above scenario and validate error in case of incorrect postcode
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should not see "firstName" on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should not see "phoneNumber" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | city      | postcode |
    | Test9     | User9    | 9876543210  | 10ABC       | Melbourne | 1111     |
