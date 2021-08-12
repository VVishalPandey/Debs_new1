Feature: Test Debenhams delivery options page


@automated @DEBD-1781
Scenario Outline: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has both options available
  Given I logout
  Then I click on "createAccountLink" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<existPassword>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpIntURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "internationalDeliveryHeader" as "Where are we delivering to?" on "deliveryOptionPage"

 Examples:
    | email              | existPassword |
    | testver@gmail.com | test1234       |

@automated @DEBD-1781
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate the page
  And I should see "useAddressDropDown" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should see "newAddressRadioButton" exist on "homeDeliveryPage"
  Then I should see "newAddressText" as "Add a new address" on "homeDeliveryPage"
  Then I click on "newAddressRadioButton" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  # And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "addressLine1" exist on "homeDeliveryPage"
  And I should see "addressLine2" exist on "homeDeliveryPage"
  And I should see "city" exist on "homeDeliveryPage"
  And I should see "state" exist on "homeDeliveryPage"
  And I should see "postcodeManual" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"

@automated @DEBD-1781
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate error messages
  Then I click on "firstName" on "homeDeliveryPage"
  Then I click on "lastName" on "homeDeliveryPage"
  Then I click on "phoneNumber" on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

@automated @DEBD- @DEBD-220
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseName>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<addressLine1>" in "addressLine1" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I should see "useAddressDropDown" exist on "homeDeliveryPage"
 
  Examples:
    | firstName | lastName | phoneNumber | name      | houseName| addressLine1| city	     | postcode|
    | Test      | User     | 1234567890  | Test User | 48       |Flat 1       | Melbourne  | 5001    |

@automated @DEBD-1781
Scenario: Validate the international delivery address edit form
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within 8 working days for Metro Areas" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

   
