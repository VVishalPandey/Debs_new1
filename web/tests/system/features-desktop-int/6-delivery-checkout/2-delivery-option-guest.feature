Feature: Test Debenhams delivery options page



@automated @DEBD-308
Scenario Outline: Navigate to Debenhams delivery options page as Guest user and validate the page with delivery options
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpIntURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "guestLogin" on "basketCheckoutPage"
  And I click on "guestLoginContinueButton" on "basketCheckoutPage"
  Then I should see "internationalDeliveryHeader" as "Where are we delivering to?" on "deliveryOptionPage"
  And I should not see "clickCollectOption" on "deliveryOptionPage"
  And I should not see "homeDeliveryHeaderText" on "deliveryOptionPage"
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

 Examples:
    | email               |
    | testuser2@gmail.com |

@automated @DEBD-308
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate error messages
  Then I click on "firstName" on "homeDeliveryPage"
  Then I click on "lastName" on "homeDeliveryPage"
  Then I click on "phoneNumber" on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

@automated @DEBD-308
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I enter "<houseName>" in "houseNumber" on "homeDeliveryPage"
  And I enter "<addressLine1>" in "addressLine1" on "homeDeliveryPage"
  And I enter "<city>" in "city" on "homeDeliveryPage"
  And I enter "<postcode>" in "postcodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I should see "deliverySelectedAddress" containing "<name>" on "homeDeliveryPage"
  And I should see "deliverySelectedAddress" containing "<addressLine1>" on "homeDeliveryPage"
  And I should see "deliverySelectedAddress" containing "<city>" on "homeDeliveryPage"
  And I should see "deliverySelectedAddress" containing "<postcode>" on "homeDeliveryPage"
  And I should see "EditAddresslink" as "Edit this address" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | name      | houseName| addressLine1	 | city	    | postcode|
    | Test      | User     | 1234567890  | Test User | 48       |40 Wallis Street| CLOVELLY |5001    |

@automated @DEBD-308
Scenario Outline: Verify edit address functionality
  When I click on "editAddressLink" on "homeDeliveryPage"
  And I should see value of "firstName" as "<firstName>" on "homeDeliveryPage"
  And I should see value of "lastName" as "<lastName>" on "homeDeliveryPage"
  And I should see value of "phoneNumber" as "<phoneNumber>" on "homeDeliveryPage"
  And I should see value of "houseNumber" as "<houseName>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressLine1>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode>" on "homeDeliveryPage"
  And I should see "cancelButton" exist on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within 8 working days for Metro Areas" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

  Examples:
    | firstName | lastName | phoneNumber | name      | houseName| addressLine1	 | city	    | state          | postcode|
    | Test      | User     | 1234567890  | Test User | 48       |40 Wallis Street| CLOVELLY | New South Wales |5001    |


@manual @DEBD-308
Scenario: Validated  input fields on delivery option page
 Given I navigate to "deliveryOptionPage"
 Then I validate each and every input fields
 And I validate mandatory and optional fields
 And I validate UI of the Page

@manual @DEBD-281
Scenario: Validate deivery lead times
	Given I am on DOTINT
	When I hover over or focus on the delivery lead time
	Then I will see the tool tip explaining the working day business rules
	Given I can see the delivery lead time tool tip
	When I hover or focus away
	Then the tool tip will close
	When QA: Different countries will have different delivery lead times







