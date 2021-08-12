Feature: Test Debenhams pca delivery address

# Home is active but CC is disabled
# Standard is active but Next Nominated is disabled
# Enter Address manually
# PCA predict
# Edit address

@automated @DEBD-178 @DEBD-1052
Scenario: Navigate to Debenhams delivery options page as logged in user and validate the page with delivery options when user has only home delivery option available and also validate the new delivery address form
  Given I navigate to "homeURL"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testFurniturePdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
	And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" containing "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"
  When I click on "newaddressLink" on "deliveryOptionPage"
  Then I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "pcaAddressField" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
	And I should not see "country" on "homeDeliveryPage"

@automated @DEBD-778
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate the page with bfpo details when selected enter address manually
  When I am in view of "enterAddressManuallyLink" on "homeDeliveryPage"
  And I click on "enterAddressManuallyLink" on "homeDeliveryPage"
  Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
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
  #And I should not see "findYourAddressButton" on "homeDeliveryPage"
	And I should not see "pcaAddressField" on "homeDeliveryPage"
  And I should see "bfpoLink" exist on "homeDeliveryPage"
  When I am in view of "bfpoLink" on "homeDeliveryPage"
  And I click on "bfpoLink" on "homeDeliveryPage"
  Then I should see "bfpoHeaderText" as "BFPO address format" on "homeDeliveryPage"
  And I should see "bfpoPara1Text" as "It is important that all mail sent through the BFPO system is addressed correctly to ensure a smooth delivery to its destination address." on "homeDeliveryPage"
  And I should see "bfpoPara2Text" as "The following information is provided as a guide when addressing mail to BFPO locations including Exercise & Operation:" on "homeDeliveryPage"
  And I should see "bfpoCloseLink" exist on "homeDeliveryPage"
  And I should see "bfpoCloseButton" exist on "homeDeliveryPage"
  And I click on "bfpoCloseButton" on "homeDeliveryPage"

@automated @DEBD-
Scenario: Navigate to Debenhams home delivery address page from above scenario and validate postcode lookup in new address
  When I am in view of "findAnotherAddressLink" on "homeDeliveryPage"
  And I click on "findAnotherAddressLink" on "homeDeliveryPage"
  When I select pca address in address field
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

@automated @DEBD- @DEBD-220
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

  Examples:
    | firstName | lastName | phoneNumber | name      |
    | Test      | User     | 9876542210  | Test User |

@automated @DEBD-70 @DEBD-281 @DEBD-291 @DEBD-203
Scenario: Validate the delivery option where next nominated option should be disabled as product not available for the same
  When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
  Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next or Nominated Day or Evening" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Sorry - we are unable to offer this option. Please return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will" on "deliveryOptionPage"

@automated @DEBD-178 @DEBD-1052
Scenario: Navigate to Debenhams delivery options page as guest user and validate the page with delivery options when user has only home delivery option available and also validate the new delivery address form
  Given I navigate to "homeURL"
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testFurniturePdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I should see "homeDeliveryText" as "Get your order delivered to a location of your choice on a day and time that suits you." on "deliveryOptionPage"
  And I should see "clickCollectText1" containing "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"
  Then I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "pcaAddressField" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
  And I should not see "country" on "homeDeliveryPage"

@automated @DEBD-
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and validate postcode lookup in new address
  When I am in view of "pcaAddressField" on "homeDeliveryPage"
  When I enter "<pcaAddress>" in "pcaAddressField" on "homeDeliveryPage"
  And I click on "pcaListAddress1" on "homeDeliveryPage"
  Then I should see "pcaSelectedAddress" containing "<pcaFullAddressLine1>" on "homeDeliveryPage"
  And I should see "pcaSelectedAddress" containing "<pcaFullAddressLine2>" on "homeDeliveryPage"
  And I should see "pcaSelectedAddress" containing "<pcaFullAddressLine3>" on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "firstNameError" as "The first name field cannot be empty." on "homeDeliveryPage"
  And I should see "lastNameError" as "The last name field cannot be empty." on "homeDeliveryPage"
  And I should see "phoneNumberError" as "Please enter a valid phone number." on "homeDeliveryPage"

  Examples:
    | pcaAddress       | pcaFullAddressLine1 | pcaFullAddressLine2	| pcaFullAddressLine3 |
    | Sapient Ltd,63   | Sapient Ltd         | 63 Turnmill Street   | London 		      |

@automated @DEBD- @DEBD-220
Scenario Outline: Navigate to Debenhams home delivery address page from above scenario and pre filled address when valid address id provided
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

  Examples:
    | firstName | lastName | phoneNumber | name      |
    | Test      | User     | 9876542210  | Test User |

@automated @DEBD-922
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
  And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I am in view of "postcodeManual" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | houseNo     | addressLine1       | city   | postcode | country |
    | Test      | User     | 9876542210  | Sapient Ltd | 63 Turnmill Street | London | EC1M 5RR   | GB     |

@automated @DEBD-922
Scenario Outline: Validate user is able to edit the name and postcode and save the new address
  When I am in view of "firstName" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I am in view of "findAnotherAddressLink" on "homeDeliveryPage"
  And I should see "findAnotherAddressLink" exist on "homeDeliveryPage"
  And I click on "findAnotherAddressLink" on "homeDeliveryPage"
  When I am in view of "pcaAddressField" on "homeDeliveryPage"
  When I enter "<pcaAddress>" in "pcaAddressField" on "homeDeliveryPage"
	And I click on "pcaListAddress1" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  When I am in view of "addressContainer" on "homeDeliveryPage"
  Then I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "savedNewAddressLine1" as "<deliveryAddressLine1>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine2" as "<deliveryAddressLine2>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine3" as "<deliveryAddressLine3>" on "homeDeliveryPage"
  And I should see "savedNewAddressLine4" as "<deliveryAddressLine4>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | pcaAddress 	             | deliveryAddressLine1 | deliveryAddressLine2            | deliveryAddressLine3 | deliveryAddressLine4 |
    | Debs      | Tester   | 11 Anchor Terrace E1 4BA  | Mrs Debs Tester      | 11 Anchor Terrace Cephas Avenue | LONDON E1 4BA        | United Kingdom       |

@automated @DEBD-922
Scenario Outline: Validate the delivery address field values when edit address link is selected and pca negative cases are validated
  When I am in view of "addressContainer" on "homeDeliveryPage"
  And I click on "editAddressLink" on "homeDeliveryPage"
	Then I should see value of "firstName" as "<firstName>" on "homeDeliveryPage"
  And I should see value of "lastName" as "<lastName>" on "homeDeliveryPage"
  And I should see value of "phoneNumber" as "<phoneNumber>" on "homeDeliveryPage"
  #And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I should see value of "houseNumber" as "<houseNo>" on "homeDeliveryPage"
  And I should see value of "addressLine1" as "<addressLine1>" on "homeDeliveryPage"
  And I should see value of "city" as "<city>" on "homeDeliveryPage"
  And I should see value of "country" as "<country>" on "homeDeliveryPage"
  And I am in view of "postcodeManual" on "homeDeliveryPage"
  And I should see value of "postcodeManual" as "<postcode>" on "homeDeliveryPage"

  Examples:
    | firstName | lastName | phoneNumber | country | houseNo           | addressLine1  | city   | postcode |
    | Debs      | Tester   | 9876542210  | GB      | 11 Anchor Terrace | Cephas Avenue | London | E1 4BA   |


@automated @DEBD-178
Scenario: Navigate to delivery address form as pre requisite to validate error cases as per next scenario
	Given I navigate to "homeURL"
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
	And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I click on "newaddressLink" on "deliveryOptionPage"
  Then I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should see "lastName" exist on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "pcaAddressField" exist on "homeDeliveryPage"
  #And I should see "findYourAddressButton" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"
  And I should see "useThisAddressButton" exist on "homeDeliveryPage"
  And I should not see "addressLine1" on "homeDeliveryPage"
  And I should not see "addressLine2" on "homeDeliveryPage"
  And I should not see "city" on "homeDeliveryPage"
  And I should not see "county" on "homeDeliveryPage"
  And I should not see "findAnotherAddressLink" on "homeDeliveryPage"
  And I should not see "bfpoLink" on "homeDeliveryPage"
  And I should not see "address" on "homeDeliveryPage"
	And I should not see "country" on "homeDeliveryPage"

@automated @DEBD-784
Scenario Outline: Validate the pca address error scenarios
	And I enter "<pcaFieldValue>" in "pcaAddressField" on "homeDeliveryPage"
	Then I should see "pcaErrorMessage" as "No results found" on "homeDeliveryPage"

	Examples:
		| pcaFieldValue |
		| !@#					  |

@automated @DEBD-784
Scenario: Validate the pca address field empty error message
	And I enter "" in "pcaAddressField" on "homeDeliveryPage"
  When I click on "useThisAddressButton" on "homeDeliveryPage"
	Then I should see "pcaInlineErrorMessage" as "The address field cannot be empty" on "homeDeliveryPage"

@automated @DEBD-784
Scenario Outline: Validate International delivery options
  When I enter "<pcaAddress>" in "pcaAddressField" on "homeDeliveryPage"
  And I click on "pcaListAddress1" on "homeDeliveryPage"
	Then I should see "pcaSelectedAddress" containing "<pcaFullAddressLine1>" on "homeDeliveryPage"
	And I should see "pcaSelectedAddress" containing "<pcaFullAddressLine2>" on "homeDeliveryPage"
	And I should see "pcaSelectedAddress" containing "<pcaFullAddressLine3>" on "homeDeliveryPage"

  Examples:
    | pcaAddress 						        | pcaFullAddressLine1		| pcaFullAddressLine2	| pcaFullAddressLine3	|
    | M1, 260 Collins St, MELBOURNE | M 1, 260 Collins St   | Melbourne 3000			| Australia 			    |

@automated @DEBD-922
Scenario Outline: Validate user is able to edit the name and postcode and save the new address
  When I am in view of "firstName" on "homeDeliveryPage"
  When I enter "<firstName>" in "firstName" on "homeDeliveryPage"
  And I enter "<lastName>" in "lastName" on "homeDeliveryPage"
  And I enter "<phoneNumber>" in "phoneNumber" on "homeDeliveryPage"
  When I am in view of "pcaAddressField" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"

  Examples:
    | firstName | lastName | phoneNumber |
    | Debs      | Tester   | 9876542210  |

@manual @DEBD-784 @awsManual
Scenario: Validate when PCA is down then error saying, "Address look up unavailable please enter address manually." is displayed
  Given I am on delivery address page
  When PCA is down or PCA library is not loaded
  Then I will see manual address form

@manual @DEBD-1052 @awsManual
Scenario: Validate the error message when user search for International address with a bag of non International products like Mac lipstick
  Given I am on delivery address page with product not delivery to International like Mac lipstick
  When I search for International address
  Then I see error stating that "Sorry, some of your items are not available for international delivery. Please edit your bag."

@manual @DEBD-1052 @awsManual
Scenario: Validate the error message when user search for International country where product cannot be deliveryed like China with a bag of International products like a dress
  Given I am on delivery address page with product capable of delivery to International like a dress
  When I search for International address like China where delivery cannot be made
  Then I will see results returned
  When I click on the address
  Then I see error stating that "we don't deliver to that country"
  And the address field will blank out

@manual @DEBD-1052
Scenario: Validate address search result for International address in delivery address form both for search result narrow and International characters
  Given I am on delivery address page with product capable of delivery to International like a dress
  When I start typing an International address
  Then I will see UK addresses first as it is based on location
  When I type more of my address
  Then it will narrow down to the International address
  When I enter international characters e.g. à, è, ù
  Then they will be recognised for international addresses e.g. Musée du Louvre, 75058 Paris

@manual @DEBD-1052 @awsManual
Scenario: Validate the PCA address results when user type in a UK or international address
	Given I am on the UK site
	And I haven't previously selected an address
	When I start typing an international address
	Then I will see UK addresses first as it is based on location
	And I type more of my address
	Then it will narrow down to the international address
	Given I am on the UK site
	And I have previously selected an international address e.g. a French address
	When I type in a new UK address
	Then I will see any relevant French addresses first
	And then UK addresses when the results narrow dow

@manual @DEBD-
Scenario: Validate the delivery address form details are retained when selected change address after entering the address using PCA and manual
  Given I have selected delivery address via PCA
  And press use this address
  And I can see the choose delivery options next vs standard or International
  When I press change delivery address
  Then I will see the delivery address form with the previously entered address is retained
  When I press enter address manually
  Then I will see the full address form
  When I have entered an address and moved to delivery option
  And I press change delivery address
  Then I will see the delivery address form with the previously entered address is retained

@manual @DEBD- @awsManual
Scenario: Validate the delivery address form details are retained when selected change delivery typre from payment page after entering the address using PCA
  Given I have selected delivery address via PCA
  And I moved to Payment page
  When I selected Change delivery type
  And I selected Home delivery again
  Then I will see the delivery address form with the previously entered address is retained

@manual @DEBD- @awsManual
Scenario: Validate the delivery address form details are retained when selected change delivery type from delivery options page after entering the address using PCA
  Given I have selected delivery address via PCA
  And press use this address
  And I can see the choose delivery options next vs standard or International
  When I press change delivery type
  And I selected Home delivery again
  Then I will see the delivery address form with the previously entered address is retained

@manual @DEBD-220 @awsManual
Scenario: Validate the address result when user start typing the address in new delivery address form via PCA
  Given I am on the payment page
  # Validation 1
  When I start typing the first character (alphanumeric)
  Then my address results start to show
  And I will see the "keep typing your address to display more results" tool tip for X seconds
  # Validation 2
  When I enter further characters (alphanumeric)
  Then my address results narrow down (Validate the results from the PCA site)
  And I clear the field
  # Validation 3
  When I enter house name, house number, business name, postcode or street
  Then relevant results will be delivered based on what I've entered (Validate the results from the PCA site)
  And I clear the field
  # Validation 4
  When I have entered my address slightly incorrect e.g. Fiefly Road instead of Fireflly Road
  Then my results will still be found by fuzzy logic
  And I clear the field
  # Validation 5
  When I have entered characters that result in multiple results e.g a county, street name or postcode (SW12 0PG)
  Then I will see the suggested address e.g. Scholar's Road, London
  And the amount of relevant results e.g. - 45 addresses
  # Validation 6
  When I click on the suggested address
  Then the results will expand to show a list of all the suggested addresses
  # Validation 7
  When I click on a suggested address
  Then the address data is populated into the address field in a single line
  And the focus is taken off the address field
  # Validation 8
  When I start removing the selected address with the backspace
  Then I will see suggested results based on the data still left in the address field (Validate the results from the PCA site)
  # Validation 9
  When I  press clear all  in the address field for the selected address
  Then the whole address field will be cleared but the focus will be still on the same field
  And I clear the field
  # Validation 10
  Then I validate addresses with company name / company name & dept / without company name & dept

@manual @DEBD-784
Scenario: Validate the RETRIEVEERROR on the delivery address
  Given I have searched for an address
  When I am disconnected from the internet
  Then I will see the RETRIEVEERROR : "Sorry , we could not retrieve this the address"
  And I will not be able to use the address

@manual @DEBD-784
Scenario: Validate the SERVICEERROR on the delivery address
  Given the PCA credits have expired
  When the user types in some characters in the address field
  Then the SERVICEERROR will trigger
  And the error will flag via tracking

@notAutomated @DEBD-220
Scenario: Validate the address confirmation component in delivery address when guest/ghost user selects a PCA address
  Given I am a guest/ghost user and I navigate to delivery address section
	When I have select an address
	And I press use this address CTA
	Then the address is populated in the address confirmation component
	And I can see edit this address link (DEBD-922 for edit functionality)
	And I am taken to down to "choose delivery option" section (next or standard)

@notAutomated @DEBD-220
Scenario: Validate the mouse clicking outside of field and clear all icon for address field
	Given I navigate to delivery address section
	When I have typed out my address manually in the address look up field
	And I haven't clicked a suggested result
	Then the use this address CTA will remain disabled until an address is selected from the result drop down
	And Clear all icon is not shown to the user in address field

@notAutomated @DEBD-778 @DEBD-281 @awsManual
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
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"

@notAutomated @DEBD-778 @DEBD-281 @DEBD-143 @awsManual
Scenario: Navigate to Debenhams delivery address page and enter address manually for guest user
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressNoCCPdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  Then I navigate to delivery options as guest user
	When I select home delivery and provide UK address details and navigate to delivery options under it
	Then I should see the saved address selected in dropdown
	Then I should see "nextNominatedOption" exist on "deliveryOptionPage"
  And I should see "standardOption" exist on "deliveryOptionPage"
  And I should see "nextNominatedOptionHeaderText" containing "Next or Nominated Day or Evening" on "deliveryOptionPage"
  And I should see "nextNominatedOptionText" containing "Sorry - we are unable to offer this option. Return to your shopping bag if you'd like to amend your order" on "deliveryOptionPage"
  And I should see "standardOptionHeaderText" containing "Standard UK Delivery" on "deliveryOptionPage"
  And I should see "standardOptionText" containing "Delivery within" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"

@notAutomated @DEBD-241 @awsManual
Scenario: Navigate to Debenhams delivery address page and select australia address and validate the international option
  Given I logout
	Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
	And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
	When I navigate to delivery options as already logged in with Australia address
	Then I should see the saved address selected in dropdown
	And I should see "internationalOption" exist on "deliveryOptionPage"
  When I click on "internationalOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@manual @DEBD-143
Scenario: Validate home delivery cancel add new address when there are saved address
	Given I navigate to home delivery as logged in user with saved addresses
	When I add a new address
	Then I should not see the saved addresses dropdown
	When I click on cancel new address form link
	Then I should see the saved addresses again and no new address form

@manual @DEBD-143
Scenario: Validate home delivery cancel add new address when there are saved address
	Given I navigate to home delivery as logged in user with saved addresses
	When I add a new address
	Then I should not see the saved addresses dropdown
	When I click on cancel new address form link
	Then I should see the saved addresses again and no new address form

@notAutomated @DEBD-241
Scenario: Navigate to Debenhams delivery options and validate the UI and messageas per desktop
	Given I navigate to home delivery as logged in user
	Then I validate the UI and messageas per desktop
