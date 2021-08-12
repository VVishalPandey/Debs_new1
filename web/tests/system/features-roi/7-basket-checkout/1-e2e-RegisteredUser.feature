Feature: Test Debenhams product checkout journey for registered with saved address

@automated
Scenario Outline: Navigate to sign page and login with RegisteredUser credentials
  Given I logout
  Then I navigate to "loginUrl"
  And I wait for "3000" milliseconds
  When I enter "<emailNewsYes>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordNewsYes>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"

  Examples:
    | emailNewsYes      | passwordNewsYes |
    | testvad@gmail.com | test1234        |

@automated
Scenario: Navigate to women dresses psp page from menu global navigation
  When I click on "menuIcon" on "commonPage"
  When I click on "Shop Departments" position "1"
  Then I "validate & click" option is available in "mainMenuList" as "Women" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Dresses" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "All dresses" on "commonPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Dresses" on "pspPage"

@automated
Scenario: Open the filter and apply Occasion -> Evening & Brand -> Phase Eight filter and validate the psp page
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I should see "filterTitle" as "Dresses" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Price" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Price"  as "filterSubMenuLinkList" as "€25 - 35" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "searchText" as "€25 - 35" on "pspPage"

@automated
Scenario: Select 1st available product on psp and add to bag the same on pdp
  Then I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I add to bag quantity "1" and go to my bag page

@automated
Scenario: Navigate to payments page with saved address and delivery option as standard
  Then I navigate to delivery options as user already loggedIn with IE savedAddress
  And I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"

@automated
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automated @DBNHST-
Scenario: Navigate to Debenhams payment page and validate the gift card section
  When I am in view of "giftCardAccordion" on "paymentPage"
  And I click on "giftCardAccordion" on "paymentPage"
  Then I should see "giftCardApplyButton" exist on "paymentPage"
  And I should see "giftCardIDField" exist on "paymentPage"
  And I should see "giftCardPinField" exist on "paymentPage"
  And I should see "giftCardHeaderText" as "You can use your Gift card to pay for all or part of your order." on "paymentPage"


@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the gift card applied
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
    | 6338309199322376 | 8521          | € 18.50         | 2376             |

@automated @DBNHST-
Scenario Outline: Navigate to Debenhams payment page and validate the 2nd gift card applied
  Then I click on "giftCardAddAnotherCardLink" on "paymentPage"
  And I enter "<gift_card_number>" in "giftCardIDField" on "paymentPage"
  And I enter "<gift_card_pin>" in "giftCardPinField" on "paymentPage"
  And I wait for "2000" milliseconds
  Then I should see "giftCardValue" as "<gift_card_value>" on "paymentPage"
  When I click on "giftCardApplyButton" on "paymentPage"

  Examples:
    | gift_card_number | gift_card_pin | gift_card_value | gift_card_ending |
    | 6338309193182925 | 5466          | € 10.00         | 2925             |

@automated @DBNHST-1429
Scenario: Validate the delivery address page for new address with MVT variation-2 and I should see the full name
  Then I am on my details page
  Then I navigate to "testDressPdpURL"
  Then I select the available size swatch
  And I am in view of "addToBagButton" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I wait for "20000" milliseconds
  And I click on "checkoutButton" on "myBagPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  Then I should see "headerText" as "Where are we delivering to?" on "homeDeliveryPage"
  And I click on "newAddressRadioButton" on "homeDeliveryPage"
  Then I should see "title" exist on "homeDeliveryPage"
  And I should see "firstName" exist on "homeDeliveryPage"
  And I should not see "lastName" on "homeDeliveryPage"
  And I should see "phoneNumber" exist on "homeDeliveryPage"
  And I should see "country" exist on "homeDeliveryPage"
  And I should see "houseNumber" exist on "homeDeliveryPage"
  And I should see "postcode" exist on "homeDeliveryPage"
  And I should see "findYourAddressButton" exist on "homeDeliveryPage"
  And I should see "enterAddressManuallyLink" exist on "homeDeliveryPage"

@manual @DBNHST-1429
Scenario: Validate that the copy under phone number changed to "We will use this to send updates about your delivery" is displayed for MVT-2 on the delivery address page

@manual @DBNHST-1429
Scenario: Validate that the delivery address entered on delivery page with MVT variation-1 is displayed in the billing address section on the payment page for guest user

@manual @DBNHST-1429
Scenario: Validate that the delivery address entered on delivery page with MVT variation-1 is displayed in the my address book page on the payment page for logged in user

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
