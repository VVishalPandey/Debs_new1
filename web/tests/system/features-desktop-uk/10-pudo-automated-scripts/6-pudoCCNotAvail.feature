Feature: Test complete journey for a SKU not having the PUDO Click & Collect Delivery Options available

@automatedPudoSanity @PUDO-MixedBag @PUDO @DEBD-3299
Scenario: Validate the logout
    # Given I navigate to "loginUrl"
    # When I click on "tab1" on "loginPage"
    # And I enter "testpudo@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    # And I enter "test1234" in "passwordField" on "loginPage"
    # And I click on "signInButton" on "loginPage"
    # And I wait for "5000" milliseconds
    Given I logout
    And I wait for "5000" milliseconds

@automatedPudoSanity @PUDO @PUDO-PDP @PUDO-MyBag @DEBD-3572  @DEBD-3221
Scenario: Validate the delivery options on furniture pdp products having only Home Delivery Option with Made to order and Delivery & assembly info
    Given I navigate to "pDpFurni2EspotAvailUrl"
    Then I am in view of "deliveryOptionSection" on "pdpPage"
    And I should see "homeDeliveryOption" exist on "pdpPage"
    And I should not see "pudoClickAndCollectOption" on "pdpPage"
    And I should not see "internationalDeliveryOption" on "pdpPage"
    And I should see "pudoMadeToOrderDeliveryOption" exist on "pdpPage"
    And I should see "pudoMadeToOrderDeliveryOptionHeader" as "Made to order" on "pdpPage"
    And I should see "pudoMadeToOrderDeliveryMoreInfoLink" exist on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryOption" exist on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryOptionHeader" as "Delivery & Assembly information" on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryMoreInfoLink" exist on "pdpPage"
    And I should see "pudoNonReturnMessaging" exist on "pdpPage" 

@automatedPudoSanity @PUDO @PUDO-PDP @PUDO-MyBag @DEBD-3572  @DEBD-3221
Scenario: Validate the delivery options on furniture pdp products having only Home Delivery Option with only Delivery & assembly info
    Given I navigate to "pDpFurni1EspotAvailUrl"
    Then I am in view of "deliveryOptionSection" on "pdpPage"
    And I should see "homeDeliveryOption" exist on "pdpPage"
    And I should not see "pudoClickAndCollectOption" on "pdpPage"
    And I should not see "internationalDeliveryOption" on "pdpPage"
    And I should not see "pudoMadeToOrderDeliveryOption" on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryOption" exist on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryOptionHeader" as "Delivery & Assembly information" on "pdpPage"
    And I should see "pudoDeliveryAndAssemblyDeliveryMoreInfoLink" exist on "pdpPage"
    And I should see "pudoNonReturnMessaging" exist on "pdpPage" 

@automatedPudoSanity @PUDO @PUDO-MyBag @DEBD-3573 @DEBD-3222
Scenario: Validate the tooltip when Click & Collect delivery option is not available
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "myBagPageHeader" exist on "myBagPage"
    And I should see "pDpFurni1EspotAvailName" product name exist on myBagPage
    And I should see "deliveryOptionSection" exist on "myBagPage"
    And I should see "availableDeliveryOption" exist on "myBagPage"
    And I validate "Standard" fullfillment option "enable" on myBagPage
    And I validate "Next or nominated day" fullfillment option "disable" on myBagPage
    And I validate "Collect from store" fullfillment option "disable" on myBagPage
    And I validate "Collect from ParcelShop" fullfillment option "disable" on myBagPage
    And I validate "International" fullfillment option "disable" on myBagPage
    And I click and validate "Standard" fullfillment option text as "Standard delivery (Within 2 weeks)£3.49 or FREE on orders £50 or over" on myBagPage
    And I click and validate "Next or nominated day" fullfillment option text as "Not available for this item" on myBagPage
    And I click and validate "Collect from ParcelShop" fullfillment option text as "Not available for this item" on myBagPage
    And I click and validate "Collect from store" fullfillment option text as "Not available for this item" on myBagPage
    And I click and validate "International" fullfillment option text as "Not available for this item" on myBagPage 

@automatedPudoSanity @PUDO @DEBD-3224
Scenario: Validate the Delivery Landing page when PUDO Parcel Click & Collect delivery options are not available
    Then I store details from myBag to validate later
    Then I navigate to delivery options as guest user
    # When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
    And I should see "clickCollectOptionDisabled" exist on "deliveryOptionPage"
    And I should see "clickCollectText1" as "Sorry, some of the items in your order are not available for Click & Collect. Please return to your shopping bag if you'd like to amend your order." on "deliveryOptionPage"