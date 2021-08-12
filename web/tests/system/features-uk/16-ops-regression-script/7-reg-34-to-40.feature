Feature: Test Debenhams Regression scenarios 34 to 40

@automated @ops-UK @checkout-J @Sno.-34
Scenario: Checkout Journey Beauty product Guest User -Add product to Bag
  Then I am on my details page
  Given I logout
  And I empty mini bag
  When I click on "menuIcon" on "commonPage"
  Then I should see "headerMenuText" as "Menu" on "globalNavigation"
  Then I "validate & click" option is available in "mainMenuList" as "Beauty" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Makeup" on "commonPage"
  Then I "validate & click" option is available in "subMenuList" as "Lipstick" on "commonPage"
  And I should see "url" contains "beauty/make-up/lipstick"
  And I click on "moreColourOptionBadging" on "pspPage"
  When I should see "beautyColourSwatches" exist on "pdpPage"
  Then I should see "colourDropDown" exist on "pdpPage"
  Then I navigate to "beautyLipstickPdpUrl"
  When I am in view of "beautyColourSwatches" on "pdpPage"
  # Then I select available size and add to bag on pdpPage
  And I select available colour "3" as "Juicy" from "colourSwatch"
  #And I should see "addToCartButtonDisplayInitially" as "No items in the cart." on "mySavedItemPage"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-34
Scenario Outline: Navigate to payments page with Click and collect delivery option
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "selectedDeliveryMethod" as "Home Delivery" on "deliveryOptionPage"
  Then I click on "changeDeliveryMethodLink" on "deliveryOptionPage"
  And I should verify the clickCollect delivery type
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"
  When I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  Then I verify "href" of "termConditionLink" as "TermAndConditionLink" on "paymentPage"
  Then I verify "href" of "privacyPolicyLink" as "PrivacyPolicyLink" on "paymentPage"

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |

@automated @ops-UK @checkout-J @Sno.-35
Scenario: Checkout Journey OB product Guest User -Add product to Bag
  Then I am on my details page
  Given I logout
  And I empty mini bag
  Then I navigate to "mantarayProduct"
  Then I select available size from "swatch"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-35
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "selectedDeliveryMethod" as "Home Delivery" on "deliveryOptionPage"
  Then I click on "changeDeliveryOptionLink" on "deliveryOptionPage"
  And I click on "nextNominatedOption" on "deliveryOptionPage"
  And I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  And I validate all options under daytime
  And I validate first evening and daytime option navigation
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automated @ops-UK @checkout-J @Sno.-35
Scenario: Navigate to payments page with delivery option as next/nominated day 
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I click on "promoCodeAccordion" on "paymentPage"
  And I enter "PS01" in "promoCodeInputField" on "paymentPage"
  Then I click on "promoCodeApply" on "paymentPage"
  And I should see "promoCodeSuccessMsg" containing "PS01: Applied" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  When I am in view of "editShoppingBagLink" on "paymentPage"
  Then I click on "editShoppingBagLink" on "paymentPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I click on "incrementStepper" on "myBagPage"
  Then I should see value of "countInputField" as "2" on "myBagPage"

@automated @ops-UK @checkout-J @Sno.-36
Scenario: Checkout Journey - Concession Product -Guest User Journey  -Add product to Bag
  Then I am on my details page
  Given I logout
  And I empty mini bag
  Then I navigate to "concessionProduct"
  Then I select available size from "swatch"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-36
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-36
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-36
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-37
Scenario: Checkout Journey - Furniture Product -Guest User Journey  -Add product to Bag and validate My bag
  Then I am on my details page
  Given I logout
  And I wait for "3000" milliseconds
  And I empty mini bag
  Then I navigate to "furnitureJouneyProduct"
  Then I click on "changeSelectedFabric" on "pdpPage"
  And I change "SelectedFabric" the product changes on "pdpPage"
  Then I click on "changeSelectedFeet" on "pdpPage"
  And I change "SelectedFeet" the product changes on "pdpPage"
  And I store the furniture colour on pdpPage
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I validate the furniture colour on myBagPage

@automated @ops-UK @checkout-J @Sno.-37
Scenario: Navigate to delivery page, validate that Click & Collect delivery option is not available and slect Home delivery
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  Then I should see "disabledOption" as "Click & Collect" on "deliveryOptionPage"
  When I select home delivery and provide UK address details
  Then I should see "disabledOption" as "Next or Nominated Day or Evening" on "deliveryOptionPage"
  #And I should see "standardDeliveryText" containing "Delivery within 65 working days" on "pdpPage"
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "selectedDeliveryMethod" as "Home Delivery" on "deliveryOptionPage"

@automated @ops-UK @checkout-J @Sno.-37
Scenario: Navigate to payments page with delivery option as Standard 
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "4000" milliseconds
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  And I should see "deliveryLeadTime" as "7 weeks" on "paymentPage"
  Then I validate the furniture colour on myBagPage

@automated @ops-UK @checkout-J @Sno.-38
Scenario: Checkout Journey - Beauty Product -Registered User Journey  -Add product to Bag
  Given I logout
  Then I am on my details page
  And I wait for "3000" milliseconds
  And I empty mini bag
  Then I navigate to "katVonDBeautyProduct"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-38
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I select home delivery and provide new address details when already logged In and navigate to delivery options under it
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"

@automated @ops-UK @checkout-J @Sno.-38
Scenario Outline: Navigate to payments page with Click and collect delivery option
  And I should see "selectedDeliveryMethod" as "Home Delivery" on "deliveryOptionPage"
  Then I click on "changeDeliveryMethodLink" on "deliveryOptionPage"
  And I should verify the clickCollect delivery type
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  Then I should see "locateStoreEnteredText" as "<storeLocateName>" on "locateStorePage"
  And I count number of "searchedStoreInfoElements" to be "<max_count>" on "locateStorePage"
  When I click on "firstStoreChoose" on "locateStorePage"
  Then I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds

  Examples:
    | storeLocateName | max_count |
    | E16FQ           | 5         |  

@automated @ops-UK @checkout-J @Sno.-38
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-38
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-39
Scenario: Checkout Journey OB product Registered User -Add product to Bag
  Given I logout
  Then I am on my details page
  And I wait for "3000" milliseconds
  Then I empty mini bag
  Then I navigate to "mantarayProduct"
  Then I select available size from "swatch"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-39
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I select home delivery and provide new address details when already logged In and navigate to delivery options under it
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "selectedDeliveryMethod" as "Home Delivery" on "deliveryOptionPage"
  Then I click on "changeDeliveryOptionLink" on "deliveryOptionPage"
  And I click on "nextNominatedOption" on "deliveryOptionPage"
  And I should see "daytimeTab" exist on "deliveryOptionPage"
  And I should see "eveningTab" exist on "deliveryOptionPage"
  # And I validate all options under daytime
  And I validate all options under evening time
  And I validate first evening and daytime option navigation
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"

@automated @ops-UK @checkout-J @Sno.-39
Scenario: Navigate to payments page with delivery option as next/nominated day 
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  Then I click on "promoCodeAccordion" on "paymentPage"
  And I enter "PS01" in "promoCodeInputField" on "paymentPage"
  Then I click on "promoCodeApply" on "paymentPage"
  And I should see "promoCodeSuccessMsg" containing "PS01: Applied" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  When I am in view of "editShoppingBagLink" on "paymentPage"
  Then I click on "editShoppingBagLink" on "paymentPage"
  And I should see "headerText" as "My Bag" on "myBagPage"
  Then I click on "incrementStepper" on "myBagPage"
  Then I should see value of "countInputField" as "2" on "myBagPage"

@automated @ops-UK @checkout-J @Sno.-40
Scenario: Checkout Journey - Concession Product -Registered User Journey  -Add product to Bag
  Given I logout
  Then I am on my details page
  And I wait for "3000" milliseconds
  Then I empty mini bag
  Then I navigate to "concessionProduct"
  Then I select available size from "swatch"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  And I wait for "3000" milliseconds

@automated @ops-UK @checkout-J @Sno.-40
Scenario: Navigate to delivery page with delivery option as standard
  Then I should scroll to "checkoutButton" on "myBagPage"
  Then I select home delivery and provide new address details when already logged In and navigate to delivery options under it
  Then I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-40
Scenario: Validate the payment page for all accordion and place order button
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "promoCodeAccordion" on "paymentPage"
  And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
  And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
  And I should see "creditCardAccordionUk" as "Pay with a Credit, Debit or Store card" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@automated @ops-UK @checkout-J @Sno.-40
Scenario: Validate the payment page delivery selected, credit card points as selected by user
  Then I should see "creditCardPointText" containing "points by paying with your Debenhams Credit Card." on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Standard Delivery" on "paymentPage"              