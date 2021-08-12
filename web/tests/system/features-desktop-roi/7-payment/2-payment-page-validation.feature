Feature: Test Debenhams Payment page


@automated @DEBD-1097
Scenario: Validate the Top Panel of Payment Page For Registered User
  Given I logout
  Then I am on my details page
  And I should see "myAccountLink" exist on "commonPage"
  And I "Remove" "all" products from "myBagPage"
  And I navigate to "clickCollectPDP"
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
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "deliveryType" exist on "paymentPage"
  And I should see "deliveryIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  And I should see "deliveryEstimationText" containing "Delivery within" on "paymentPage"
  And I should see "deliveryEstimationText" containing "working days" on "paymentPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  And I should see "productNameElements" exist on "paymentPage"
  And I should see "productImageElements" exist on "paymentPage"
  And I should see "productSwatchElements" exist on "paymentPage"
  And I should see "productQuantityElements" exist on "paymentPage"
  And I should see "productPriceElements" exist on "paymentPage"
  And I should see "editShoppingBagLink" exist on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"


@automated @DEBD-1097
Scenario: Validate the change delivery method on Payment Page For Registered User
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@automated @DEBD-1097
Scenario Outline: Validate the change store link on Payment Page For Registered User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "changeStore" exist on "paymentPage"
  When I click on "changeStore" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

Examples:
  | storeLocateName |
  | D22F903        |

@automated @DEBD-1097
Scenario: Validate the change address link on Payment Page For Registered User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I click on "standardOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "changeDeliveryMethod" exist on "paymentPage"
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@automated @DEBD-1097
Scenario: Validate the edit shopping bag link on Payment Page For Registered User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I click on "standardOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "editShoppingBagLink" exist on "paymentPage"
  When I click on "editShoppingBagLink" on "paymentPage"
  Then I should see "headerText" exist on "myBagPage"

@notAutomated @DEBD-1097
Scenario Outline: Validate the Top Panel of Payment Page For Guest User
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
  When I click on "guestLogin" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "signInButton" on "basketCheckoutPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I select home delivery and provide UK address details
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"
  And I should see "deliveryType" exist on "paymentPage"
  And I should see "deliveryIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  #And I validate "delveryAddress" matches as entered on "deliveryPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  And I should see "productNameElements" exist on "paymentPage"
  And I should see "productImageElements" exist on "paymentPage"
  And I should see "productSwatchElements" exist on "paymentPage"
  And I should see "productQuantityElements" exist on "paymentPage"
  And I should see "productPriceElements" exist on "paymentPage"
  And I should see "editShoppingBagLink" exist on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"

Examples:
    | email                      |
    | davemash@test.com          |


@notAutomated @DEBD-1097
Scenario Outline: Validate the change delivery method on Payment Page For Guest User
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

Examples:
    | email                      |
    | davemash@test.com          |

@notAutomated @DEBD-1097
Scenario Outline: Validate the change store link on Payment Page For Guest User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "changeStore" exist on "paymentPage"
  When I click on "changeStore" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

Examples:
  | storeLocateName |
  | W1U 6PB         |


@notAutomated @DEBD-1097
Scenario: Validate the change address link on Payment Page For Guest User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I click on "standardOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "changeDeliveryMethod" exist on "paymentPage"
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@notAutomated @DEBD-1097
Scenario: Validate the edit shopping bag link on Payment Page For Guest User
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I click on "loggedInuserUKOption" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  And I click on "standardOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "editShoppingBagLink" exist on "paymentPage"
  When I click on "editShoppingBagLink" on "paymentPage"
  Then I should see "headerText" exist on "myBagPage"


@notAutomated @DEBD-1107 @DEBD-1105 @DEBD-1398
Scenario: Validate the No Saved Card & Address on Payment Page For Registered User
  Given I logout
  Then I am logged in without saved address and card
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I select home delivery and provide UK address details
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "newPaymentCardForm" exist on "paymentPage"
  And I should see "saveThisCardCheckbox" exist on "paymentPage"
  And I verify "value" of "saveThisCardCheckbox" as "true" on "paymentPage"
  And I should see "sameAsDeliveryAddressRadioLabel" as "Same as delivery address" on "paymentPage"
  And I should see "sameAsDeliveryAddressRadioButton" exist on "paymentPage"
  And I verify "class" of "sameAsDeliveryAddress" as "checked" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should not see "addNewBillingAddressForm" on "paymentPage"
  When I click on "useNewBillingAddressRadioButton" on "paymentPage"
  Then I should see "addNewBillingAddressForm" exist on "paymentPage"
  And I should see "requiredFieldCopy" exist on "paymentPage"
  And I should see "requiredFieldCopy" as "* Required field" on "paymentPage"
  And I should see "titleDropDown" exist on "paymentPage"
  And I should see "firstNameField" exist on "paymentPage"
  And I should see "lastNameField" exist on "paymentPage"
  And I should see "phoneNumberField" exist on "paymentPage"
  And I should see "phoneNumberMessage" exist on "paymentPage"
  And I should see "findAddressField" exist on "paymentPage"
  And I verify "placeholder" of "findAddressField" as "Type in your postcode or address" on "paymentPage"
  And I should see "useThisAddressCTA" exist on "paymentPage"
  And I should see "enterAddressManuallyLink" exist on "paymentPage"
  And I should see "bfpoLink" exist on "paymentPage"


@manual @DEBD-1105 @DEBD-1398
Scenario: Validate the card is saved when the user leaves the save this card checkbox ticked
  Given I leave the "saveThisCardCheckbox" ticked
  Then I should see "paymentCard" saved in My Account
  And I should see "deliveryAddress" pre-populated as the billing address
  Then I should be able to search and select countries that I am unable to on the delivery page

@manual @DEBD-1105
Scenario: Validate the card is not saved when the user unchecks the save this card checkbox
  Given I uncheck the "saveThisCardCheckbox"
  Then I should not see "paymentCard" saved in My Account

@notAutomated @DEBD-1105 @DEBD-1033
Scenario: Validate the Saved Card & No Address on Payment Page For Registered User
  Given I logout
  Then I am on my details page with a saved card and no saved address
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Standard Delivery and entered address
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "cardNumber" exist on "paymentPage"
  And I should see "expiryDate" exist on "paymentPage"
  And I should see "cardIcon" exist on "paymentPage"
  And I should see "securityNumberField" exist on "paymentPage"
  And I should see "securityNumberField" as "" on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "unselected" on "paymentPage"
  And I should see "addressDropdownRadioButton" exist on "paymentPage"
  And I should see "addressDropdownRadioButton" as "selected" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"
  Then I click on "changeDeliveryMethodLink" on "paymentPage"
  Then I should see "deliveryMethodSection" exist on "deliveryMethodPage"
  And I should see "homeDelivery" exist on "deliveryMethodPage"
  And I should see "clickAndCollect" exist on "deliveryMethodPage"
  And I am on paymentPage and I have chosen clickAndCollect as my Delivery method
  Then I should see "addressDropdownRadioButton" as "selected" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"

@manual @DEBD-1108
Scenario: Validate the Saved Card & No Address on Payment Page For Registered User
  Then I should see "addressDropDown" defaulted to the address on saved card selected
  And I should see delivery address entered also in "addressDropDown" on "paymentPage"

@notAutomated @DEBD-1034 @DEBD-1108
Scenario: Validate the Saved Card & No Address on Payment Page with Click & Collect Delivery Method For Registered User
  Given I logout
  Then I am on my details page with a saved card and no saved address
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen clickAndCollect as my Delivery method
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "cardNumber" exist on "paymentPage"
  And I should see "expiryDate" exist on "paymentPage"
  And I should see "cardIcon" exist on "paymentPage"
  And I should see "securityNumberField" exist on "paymentPage"
  And I should see "securityNumberField" as "" on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "unselected" on "paymentPage"
  And I should see "addressDropdownRadioButton" exist on "paymentPage"
  And I should see "addressDropdownRadioButton" as "selected" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"
  Then I should see "savedAddressRadioButton" exist on "paymentPage"
  And I should see "savedAddressRadioButton" as selected on "paymentPage"


@manual @DEBD-1108
Scenario: Validate the Saved Card & No Address on Payment Page For Registered User
  Then I should see "addressDropDown" defaulted to the address on saved card selected
  And I should see delivery address entered also

@notAutomated @DEBD-1105
Scenario: Validate the Saved Card which does not require a security number on Payment Page For Registered User
  Given I logout
  Then I am on my details page with a saved card which does not require a security number
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen clickAndCollect as my Delivery method
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "cardNumber" exist on "paymentPage"
  And I should see "expiryDate" exist on "paymentPage"
  And I should see "cardIcon" exist on "paymentPage"
  And I should not see "securityNumberField" on "paymentPage"

@notAutomated @DEBD-1105 @DEBD-1033 @DEBD-907
Scenario: Validate the Multiple Saved Card & Multiple Addresses on Payment Page For Registered User
  Given I logout
  Then I am on my details page with multiple saved cards and multiple saved addresses
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Standard Delivery and entered address
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "savedCardsDropDown" exist on "paymentPage"
  When I select "savedCardsDropDown" on "paymentPage"
  Then I should see "listOfSavedCards" exist on "paymentPage"
  And I should see "endingInCopy" as "Ending in" on "paymentPage"
  And I should see "cardNumber" exist on "paymentPage"
  And I should see "expiryDate" exist on "paymentPage"
  And I should see "expiryDate" contains "Expires in" on "paymentPage"
  And I should see "cardIcon" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "unselected" on "paymentPage"
  And I should see "billingAddressRadioButton" exist on "paymentPage"
  And I should see "billingAddressRadioButton" as selected on "paymentPage"
  And I should see "billingAddressDropDown" exist on "paymentPage"
  When I select "billingAddressDropDown" on "paymentPage"
  Then I should see "listOfSavedAddresses" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"
  Then I click on "changeDeliveryMethodLink" on "paymentPage"
  Then I should see "deliveryMethodSection" exist on "deliveryMethodPage"
  And I should see "homeDelivery" exist on "deliveryMethodPage"
  And I should see "clickAndCollect" exist on "deliveryMethodPage"
  And I am on paymentPage and I have chosen clickAndCollect as my Delivery method
  Then I should see "billingAddressRadioButton" as selected on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"

@manual @DEBD-1105 @DEBD-1033
Scenario: Validate the Saved Card on Payment Page For Registered User
  And I should see ***** and last four digits of card in "cardNumber" on "paymentPage"
  And I should see "expiryDate" as "MMYY" on "paymentPage"
  Then I should see "lastSavedCard" as selected by default
  And I can switch between the saved cards
  And I should see "billingAddressOnSavedCard" as selected by default in "billingAddressDropDown"
  And I can switch between the saved addresses

@notAutomated @DEBD-1105 @DEBD-1033 @DEBD-907
Scenario: Validate the Multiple Saved Card with an expired card on Payment Page For Registered User
  Given I logout
  Then I am on my details page with multiple saved cards and multiple saved addresses
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Standard Delivery and entered address
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "savedCardsDropDown" exist on "paymentPage"
  When I select "savedCardsDropDown" on "paymentPage"
  Then I should see "expiryDate" as "Red" on "paymentPage"
  Then I should see "exspiredCopy" as "expired" in "Red" besides "cardNumber" on "paymentPage"
  And I should see "removeExpiredCreditCardLink" exist on "paymentPage"
  When I click on "removeExpiredCreditCardLink" on "paymentPage"
  Then I should see "spinner" exist on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "removedFromPaymentSuccessMessage" exist on "paymentPage"
  And I should not see "expiredCreditCard" on "paymentPage"
  And I should not see "expiredCreditCard" on "mySavedCardPage"


@manual @DEBD-1109
Scenario: Validate an expired card on Payment Page For Registered User
  Given I logout
  Then I am on my details page with an expired saved card
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see "exspiredCopy" as "expired" in "Red" besides "cardNumber" on "paymentPage"
  And I should see "removeExpiredCreditCardLink" exist on "paymentPage"
  And I should see "removeExpiredCreditCardLink" underneath "cardNumber" on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "selected" on "paymentPage"
  And I should see "useNewPaymentCardForm" exist on "paymentPage"

@manual @DEBD-1109
Scenario: Validate multiple expired cards on Payment Page For Registered User
  Given I logout
  Then I am on my details page with an expired saved card
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see "exspiredCopy" as "expired" in "Red" besides "cardNumbers" on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "unselected" on "paymentPage"

@notAutomated @DEBD-1105 @DEBD-1033
Scenario: Validate the Multiple Saved Card & Multiple Addresses on Payment Page For Registered User
  Given I logout
  Then I am on my details page with multiple saved cards and multiple saved addresses
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen clickAndCollect Delivery as my Delivery method
  Then I should see "endingInRadioButton" exist on "paymentPage"
  And I should see "endingInRadioButton" as selected on "paymentPage"
  And I should see "savedCardsDropDown" exist on "paymentPage"
  When I select "savedCardsDropDown" on "paymentPage"
  Then I should see "listOfSavedCards" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" exist on "paymentPage"
  And I should see "useNewPaymentCardRadioButton" as "unselected" on "paymentPage"
  And I should see "billingAddressRadioButton" exist on "paymentPage"
  And I should see "billingAddressRadioButton" as selected on "paymentPage"
  And I should see "billingAddressDropDown" exist on "paymentPage"
  When I select "billingAddressDropDown" on "paymentPage"
  Then I should see "listOfSavedAddresses" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"

@manual @DEBD-1105 @DEBD-1033
Scenario: Validate the Saved Card on Payment Page For Registered User
  Then I should see "lastSavedCard" as selected by default
  And I can switch between the saved cards
  And I should see "billingAddressOnSavedCard" as selected by default
  And I can switch between the saved addresses


@notAutomated @DEBD-1107 @DEBD-1105
Scenario: Validate the No Saved Card & Address on Payment Page For Guest User
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen clickAndCollect as my Delivery method
  Then I should see "addNewAddressForm" exist on "paymentPage"
  And I should see "newCardForm" exist on "paymentPage"


@notAutomated @DEBD-1107
Scenario: Validate the Change Delivery Address & Select Click & Collect on Payment Page For Registered User
  Given I logout
  Then I am on my details page with no saved cards and addresses
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Standard Delivery and entered address
  When I click on "changeDeliveryMethodLink" on "paymentPage"
  Then I should see "deliveryMethodSection" exist on "deliveryMethodPage"
  And I should see "homeDelivery" exist on "deliveryMethodPage"
  And I should see "clickAndCollect" exist on "deliveryMethodPage"
  When I select "clickAndCollect" on "deliveryMethodPage"
  And I navigate to paymentPage
  Then I should see "savedAddressRadioButton" exist on "paymentPage"
  And I should see "savedAddressRadioButton" as selected on "paymentPage"
  And I should see "savedAdress" as "addressEnteredForStandard" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"

@notAutomated @DEBD-1107
Scenario: Validate the the Change Delivery Address & Select Click & Collect on Payment Page For Guest User
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Standard Delivery and entered address
  When I click on "changeDeliveryMethodLink" on "paymentPage"
  Then I should see "deliveryMethodSection" exist on "deliveryMethodPage"
  And I should see "homeDelivery" exist on "deliveryMethodPage"
  And I should see "clickAndCollect" exist on "deliveryMethodPage"
  When I select "clickAndCollect" on "deliveryMethodPage"
  And I navigate to paymentPage
  Then I should see "savedAddressRadioButton" exist on "paymentPage"
  And I should see "savedAddressRadioButton" as selected on "paymentPage"
  And I should see "savedAdress" as "addressEnteredForStandard" on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" exist on "paymentPage"
  And I should see "useNewBillingAddressRadioButton" as unselected on "paymentPage"

@notAutomated @DEBD-1098
Scenario: Validate the Payment Types on Payment Page
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "pdpBeautyColorProduct"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  Then I should see "leftPanel" exist on "paymentPage"
  And I should see "paymentContainerTitle" exist on "paymentPage"
  And I should see "paymentContainerTitle" as "Select payment method" on "paymentPage"
  And I should see "rewardCardAccordion" exist on "paymentPage"
  And I should see "rewardCardAccordionTitle" as "Pay with a reward club card" on "paymentPage"
  And I should see "rewardCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithGiftCardAccordion" exist on "paymentPage"
  And I should see "payWithGiftCardAccordionTitle" as "Pay with a gift card" on "paymentPage"
  And I should see "payWithGiftCardAccordion" as "closed" on "paymentPage"
  And I should see "payWithCardAccordion" exist on "paymentPage"
  And I should see "payWithCardAccordionTitle" as "Pay with a credit, debit or store card" on "paymentPage"
  And I should see "payWithCardAccordion" as "open" on "paymentPage"
  And I should see "secureCheckout" exist on "paymentPage"
  And I should see "padLockIcon" exist on "paymentPage"

@manual @DEBD-1098
Scenario: Validate that the Pay with Card Accordion remains open until all the payment is covered by another tender type
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I click on any other payment containers
  Then the "payWithCardAccordion" remains open until full payment is covered by another tender type

@manual @DEBD-1111 @DEBD-1112
Scenario: Validate user has entered a credit card type that covers the full balance on Payment Page For Registered User for Home Delivery
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Home Delivery as my Delivery Method
  When I have entered a credit card that covers the full balance
  And I have entered correct CVV for my saved card
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  And I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-1111 @DEBD-1112
Scenario: Validate user has entered a credit card type that covers the full balance on Payment Page For Guest User for Home Delivery
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Home Delivery as my Delivery Method
  When I have entered credit card that covers the full balance
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  And I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-1111 @DEBD-1112
Scenario: Validate user has entered credit card that covers the full balance on Payment Page For Registered User for Click & Collect
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Click And Collect as my Delivery Method
  When I have chosen credit card that covers the full balance
  And I have entered correct CVV for my saved card
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  And I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-1111 @DEBD-1112
Scenario: Validate user has entered a credit card that covers the full balance on Payment Page For Guest User For Click & Collect
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Click And Collect as my Delivery Method
  When I have chosen a credit card that covers the full balance
  And I have entered billing address
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  And I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see "loaderIcon" exist on "paymentPage"
  And I should see "skelatonOrderConfirmation" exist on "orderConfirmationPage"

@manual @DEBD-1111
Scenario: Validate user has entered a gift Card that covers the full balance on Payment Page
  Given I logout
  Then I am on my details page
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage
  When I have entered a giftCard that covers the full balance
  Then I should see "payWithCardAccordion" as greyed out on "paymentPage"
  And the billing address container should move above "payWithCardAccordion" for completion

@manual @DEBD-1398
Scenario: Validate user has entered billing address then the Place Order & Pay Button is enabled
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  And I "Remove" "all" products from "mySavedItems"
  When I navigate to "testDressPdpURL"
  And I select available size enter quantity as "1" and add to bag on pdpPage
  And I validate current pdp product "exist" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  And I am on paymentPage and I have chosen Home Delivery as my Delivery Method
  When I have entered billing Address
  Then I should see "placeOrderPayCTA" as "enabled" on "paymentPage"
  And I should see "placeOrderPayCTA" should change from grey to orange and become clickable
  When I click on "placeOrderPayCTA" on "paymentPage"
  Then I should see errors on the card detail fields

@manual @DEBD-1110
Scenario: Validate the verified by visa iframe
  Given I used a visa card to pay
  When I press place order and pay
  Then I am taken to the verified by visa iframe

@manual @DEBD-1110
Scenario: Validate the verified by visa iframe
  Given have signed up to verified by visa
  When I press place order and pay
  Then I am taken to the verified by visa iframe

@manual @DEBD-1110
Scenario: Validate that the user is able to use multiple payment methods on payment Page
  Given I am on Payment Page
  When I enter multiple payment methods
  Then I should be able to place order
