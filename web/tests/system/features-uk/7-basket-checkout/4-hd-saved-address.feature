Feature: Test Debenhams home delivery when user is having saved address

@automated @DBNHST-123
Scenario: Navigate to Debenhams home delivery address page as a user having saved address and validate the page when use saved address is selected
  Given I logout
  Then I navigate to pdp "dress" and add to bag
  And I navigate to delivery options as user with saved address
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "savedAddressRadioButton" exist on "homeDeliveryPage"
  And I should see "newAddressRadioButton" exist on "homeDeliveryPage"
  And I should see "savedAddressText" as "Use saved address" on "homeDeliveryPage"
  And I should see "newAddressText" as "Add a new address" on "homeDeliveryPage"
  When I click on "savedAddressRadioButton" on "homeDeliveryPage"
# Then I should see "useAddressDropDown" exist on "homeDeliveryPage"

@automated @DBNHST-123
Scenario: Navigate to Debenhams home delivery address page as a user having saved address and validate the journey when selected saved address
  When I click on "savedAddressRadioButton" on "homeDeliveryPage"
  And I click on "savedAddressOption2" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Get it" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
# When I click on "standardOption" on "deliveryOptionPage"
# Then I should see "deliveryMessage" as "Your order will arrive within five working days, between 8am - 6pm (excludes public holidays)." on "deliveryOptionPage"

@automated @DBNHST-123
Scenario: Navigate to Debenhams home delivery address page with saved address and validate the page when new address is selected
  Given I logout
  Then I navigate to pdp "dress" and add to bag
  And I navigate to delivery options as user with saved address
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "savedAddressRadioButton" exist on "homeDeliveryPage"
  And I should see "newAddressRadioButton" exist on "homeDeliveryPage"
  When I click on "newAddressRadioButton" on "homeDeliveryPage"
  Then I should not see "useAddressDropDown" on "homeDeliveryPage"
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

@automated @DBNHST-123 @Issue408Fixed
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate the page with bfpo details when selected enter address manually
  When I click on "enterAddressManuallyLink" on "homeDeliveryPage"
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
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
  And I should not see "enterAddressManuallyLink" on "homeDeliveryPage"
  And I should not see "findYourAddressButton" on "homeDeliveryPage"
  And I should see "bfpoLink" exist on "homeDeliveryPage"
  When I click on "bfpoLink" on "homeDeliveryPage"
  Then I should see "bfpoHeaderText" as "BFPO address format" on "homeDeliveryPage"
  And I should see "bfpoPara1Text" as "It is important that all mail sent through the BFPO system is addressed correctly to ensure a smooth delivery to its destination address." on "homeDeliveryPage"
  And I should see "bfpoPara2Text" as "The following information is provided as a guide when addressing mail to BFPO locations including Exercise & Operation:" on "homeDeliveryPage"
  And I should see "bfpoCloseLink" exist on "homeDeliveryPage"
  And I should see "bfpoCloseButton" exist on "homeDeliveryPage"
  And I click on "bfpoCloseButton" on "homeDeliveryPage"

@automated @DBNHST-123
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and validate postcode lookup in new address
  When I click on "findAnotherAddressLink" on "homeDeliveryPage"
  And I enter "<houseNumber>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcode" on "homeDeliveryPage"
  And I click on "findYourAddressButton" on "homeDeliveryPage"
  Then I should see "address" exist on "homeDeliveryPage"
  And I should see "addressSelectDebenhams" exist on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode |
    | Test1     | User1    | 9876543210  | 10          | NW13FG   |

@automated @DBNHST-123
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I click on "findAnotherAddressLink" on "homeDeliveryPage"
  And I enter "<firstName>" in "firstName" on "homeDeliveryPage"
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
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  And I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Get it" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  # When I click on "standardOption" on "deliveryOptionPage"
  # Then I should see "deliveryMessage" as "Your order will arrive within five working days, between 8am - 6pm (excludes public holidays)." on "deliveryOptionPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNumber | postcode | houseNoPreFill    | addressL1PreFill | country | city   | postcode1 |
    | Test2     | User2    | 9876543210  | 11          | E14BA    | 11 Anchor Terrace | Cephas Avenue    | GB      | LONDON | E1 4BA    |

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the saved addresses are displayed in different containers and not as useAddressDropDown

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the first saved address radio button is selected by default and the container contains the Use this address button

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to select any of the saved address radio button

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that the add new address container has dashed border with teal +

@manual @DBNHST-1430
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to see the title options in boxes with Mrs as default selected on clicking add new address link

@manual @DBNHST-1513
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to see the Add title input flied on selecting title as Other on add new address delivery page

@manual @DBNHST-1423
Scenario: Navigate to the delivery page of a registered user with saved addresses and validated that user is able to add new address successfully which also get reflected on the My aaddress book and the billing address page
