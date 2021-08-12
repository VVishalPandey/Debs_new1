Feature: Test Debenhams pca delivery address

# Home is active but CC is disabled
# Standard is active but Next Nominated is disabled
# Enter Address manually
# PCA predict
# Edit address


@automated @DEBD-1074
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has only home delivery option available and also validate the new delivery address form
  Given I navigate to "homeURL"
  Given I logout
  Then I am on my details page
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
	And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  When I click on "newaddressLink" on "deliveryOptionPage"
  And I should see "title" exist on "homeDeliveryPage"
  #And I should see the 'other' option under the Title dropdown 
  #And I select 'other' in the title dropdown
  #Then I should see 'Add tittle' label and additional mandatory 'Textfield'
  #And I leave the 'Textfield' blank
  #And press use this address
  #Then I should see the error for the other text field mandatory
  #And I should enter the value in to the other 'textfield'
  #And I should see the value entered under the order summary on payment page


@notAutomated @DEBD-1092
Scenario Outline: enter the  delivery details  and proceed to paymentPage
  When I enter "<firstName>" in "firstName" on "deliveryOptionPage"
  And I enter "<lastName>" in "lastName" on "deliveryOptionPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "deliveryOptionPage"
  And I enter "<houseName>" in "houseNumberText" on "deliveryOptionPage"
  And I enter "<addressLine1>" in "addressLine1Text" on "deliveryOptionPage"
  And I enter "<city>" in "cityText" on "deliveryOptionPage"
  And I enter "<postCode>" in "postCodetext" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "deliveryOptionPage"
  And I should see "deliverySelectedAddress" containing "<name>" on "deliveryOptionPage"
  And I should see "deliverySelectedAddress" containing "<adressLine1>" on "deliveryOptionPage"
  And I should see "deliverySelectedAddress" containing "<city>" on "deliveryOptionPage"
  And I should see "deliverySelectedAddress" containing "<postCode>" on "deliveryOptionPage"
  And I should see "deliverySelectedAddress" containing "<country>" on "deliveryOptionPage"
  And I should see "EditAddresslink" as "Edit this address" on "deliveryOptionPage"
  And I should see "deliveryTimeText" as "Your order will arrive within 8 working days for Metro Areas and 10 working days for the rest of Australia (excludes public holidays)" on "deliveryOptionPage"
  When I click "EditAddressLink" on "deliveryOptionPage"
  And I should see "firstNameText" containing "<firstName>" on "deliveryOptionPage"
  And I should see "lastNameText" containing "<lastName>" on "deliveryOptionPage"
  And I should see "phoneNumberText" containing "<phoneNumber>" on "deliveryOptionPage"
  And I should see "houseNumberText" containing "<houseName>" on "deliveryOptionPage"
  And I should see "addressLine1" containing "<addressLine1>" on "deliveryOptionPage"
  And I should see "city" containing "<city>" on "deliveryOptionPage"
  And I should see "postcodeText" containing "<postcode>" on "deliveryOptionPage"
  And I should see "cancelButton" on "deliveryOptionPage"
  When I click on "useThisAddressButton" on "deliveryOptionPage"
  Then I should see "paymentButton" as "proceedtoPayment" on "deliveryOptionPage"
  And I click "paymentButton" on "deliveryOptionPage"
  Then I should see "paymentMethodText" as "Select payment method" on "paymentPage"

  Examples:
    | firstName | lastName | phoneNumber | name      | houseName| addressLine1	 | city	      | postcode|country|
    | Test      | User     | 1234567890  | Test User | 48       |Dublin City Council| Dublin  |D02 AF30    |  Dublin|
  
@notAutomated @DEBD-1091 
Scenario Outline: Validate the delivery address field values when edit address link is selected
  When I am in view of "editAddressLink" on "homeDeliveryPage"  
  And I click on "editAddressLink" on "homeDeliveryPage"
  Then I should see value of "firstName" as "<firstName>" on "homeDeliveryPage"
  And I should see value of "lastName" as "<lastName>" on "homeDeliveryPage"
  And I should see value of "phoneNumber" as "<phoneNumber>" on "homeDeliveryPage"
  #And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I should see value of "houseNumber" as "<houseNo>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressLine1>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "country" as "<county>" on "homeDeliveryPage"
  And I am in view of "postcodeManual" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<Eircode>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | country     | houseNo           | County  | city   | Eircode |
    | Test      | User     | 9876542210  | Ireland     | Dublin City Council | Dublin | Dublin | D02 AF30   |

@automated @DEBD-1091
Scenario Outline: Validate user is able to edit the name and postcode and save the new address
  When I am in view of "firstName" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I am in view of "EircodeManual" on "homeDeliveryPage"
  And I enter "<Eircode>" in "EircodeManual" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "addressContainer" on "homeDeliveryPage"
  Then I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "savedNewAddressLine1" as "<deliveryAddressLine1>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine2" as "<deliveryAddressLine2>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine3" as "<deliveryAddressLine3>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine4" as "<deliveryAddressLine4>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | Eircode | deliveryAddressLine1 | deliveryAddressLine2            | deliveryAddressLine3 | deliveryAddressLine4 |
    | Debs      | Tester   | D02 AF30   | Mrs Debs Tester      | 11 Anchor Terrace Cephas Avenue | Ireland D02 AF30        | Dublin       |
	
@notAutomated @DEBD-1092 @DEBD-281
Scenario: Navigate to Debenhams delivery address page and enter address manually for logged  in user
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressNoCCPdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
	And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  When I click on "newaddressLink" on "deliveryOptionPage"
	Then I enter the address manually
	And I use this address
	Then I should see the saved address selected in dropdown
	Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next or Nominated Day or Evening" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Sorry - we are unable to offer this option. Return to your shopping bag if you'd like to amend your order" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"

@manual @DEBD-1093
Scenario: Validate home delivery cancel add new address when there are saved address
	Given I navigate to home delivery as logged in user with saved addresses
	When I add a new address
	Then I should not see the saved addresses dropdown
	When I click on cancel new address form link
	Then I should see the saved addresses again and no new address form

@manual @DEBD-1093
Scenario: Validate home delivery cancel add new address when there are saved address
	Given I navigate to home delivery as logged in user with saved addresses
	When I add a new address
	Then I should not see the saved addresses dropdown
	When I click on cancel new address form link
	Then I should see the saved addresses again and no new address form

