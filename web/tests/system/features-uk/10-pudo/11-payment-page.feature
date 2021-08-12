Feature: Test Debenhams Payment page changes for PUDO

@notAutomated @DEBD-3231 @DEBD-3537
Scenario: Validate the order summary section when PUDO is enabled and CC sku is added to bag with selected store as Debenhmas
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "debenhamsStoreClickCollectPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "E16FQ" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  And I am in view of "changeStoreLink" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
  And I should see "denehamsLogoIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  And I should see "deliveryEstimationText1" containing "Delivery within" on "paymentPage"
  And I should see "deliveryEstimationText2" containing "working days" on "paymentPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  Then I should see "clickCollectTotalPay" containing "FREE" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@notAutomated @DEBD-3231 @DEBD-3537
Scenario: Validate the change delivery method link
  Then I should see "changeDeliveryMethod" exist on "paymentPage"
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"

@notAutomated @DEBD-3231 @DEBD-3537
Scenario: Validate the order summary section when PUDO is enabled and CC sku is added to bag with selected store as Parcel shop
  Given I logout
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "parcelStoreClickCollectPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I store details from myBag to validate later
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
  And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
  And I click on "clickCollectOption" on "deliveryOptionPage"
  When I enter "<storeLocateName>" in "locateStoreField" on "locateStorePage"
  And I click on "locateStoreButton" on "locateStorePage"
  And I click on "firstStoreChoose" on "locateStorePage"
  And I am in view of "changeStoreLink" on "locateStorePage"
  Then I should see "selectedStoreName" containing "<firstStoreName>" on "locateStorePage"
  And I should see "deliveryMessage" containing "Your order will be ready to collect from" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
  And I should see "parcelShopLogoIcon" exist on "paymentPage"
  And I should see "changeDeliveryMethod" exist on "paymentPage"
  And I should see "deliveryAddress" exist on "paymentPage"
  And I should see "deliveryEstimationText" containing "Delivery within" on "paymentPage"
  And I should see "deliveryEstimationText" containing "working days" on "paymentPage"
  And I should see "orderSummaryProductList" exist on "paymentPage"
  Then I should see "clickCollectTotalPay" containing "£" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@notAutomated @DEBD-3231 @DEBD-3537
Scenario: Validate the change delivery method link
  Then I should see "changeDeliveryMethod" exist on "paymentPage"
  When I click on "changeDeliveryMethod" on "paymentPage"
  Then I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"  

@automated @DEBD-3231
Scenario: Validate the order summary section when PUDO is disabled and CC sku is added to bag with selected store as Debenhmas
  Given I logout
  Then I am on my details page
  And I navigate to "basketCheckoutUrl"
  And I "Remove" "all" products from "myBagPage"
  When I navigate to "testDressPdpURL"
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
  Then I should see "headerText" as "Payment" on "paymentPage"
  Then I should see "orderSummaryAccordion" as "Order summary" on "paymentPage"
  Then I should scroll to "orderSummaryAccordion" on "paymentPage"
  When I "open" "orderSummaryAccordion" accordion on "paymentPage"
  Then I should see "deliveryType" as "Click & Collect" on "paymentPage"
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
  Then I should see "clickCollectTotalPay" containing "FREE" on "paymentPage"
  And I should see "placeOrderButton" exist on "paymentPage"

@notAutomated @DEBD-3231
Scenario: Verify that user is able to make payment using Gift card + Promocode Free delivery STDPUDO(1.99) no minimal spend

@notAutomated @DEBD-3231
Scenario: Verify that user is able to make payment using Beauty card + Free delivery PRMPUDO(3.99) no minimal spend

@notAutomated @DEBD-3231
Scenario: Verify that user is able to make payment using Gift card + Beauty card + Free delivery STDPUDO (1.99) £20 minimal spend

@notAutomated @DEBD-3231
Scenario: Verify that user is able to make payment using Gift card + Credit card + Free delivery PRMPUDO (3.99) £20 minimal spend

@notAutomated @DEBD-3231
Scenario: Verify that user is able to make payment using Beauty card + Credit card + Free delivery PRMPUDO (3.99) £20 minimal spend