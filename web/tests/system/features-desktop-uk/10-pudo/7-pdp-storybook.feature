  Feature: Test Delivery/Returns options on Debenhams PDP  page.

@automated @DEBD-3572  @DEBD-3221
Scenario: Validate the PUDO Click & Collect delivery options for product having only both Parcel collection option
      Given I navigate to "pDpParcelOnlyAvailableUrl"
      Then I am in view of "deliveryOptionSection" on "pdpPage"
      And I should see "homeDeliveryOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionDisabled" exist on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£4.99" on "pdpPage"
      And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
      And I should see "internationalDeliveryOption" exist on "pdpPage"
      And I should see "internationalDeliveryMoreInfoLink" exist on "pdpPage"
      And I should see "pudoNonReturnMessaging" exist on "pdpPage"

@automated @DEBD-3572  @DEBD-3221
Scenario: Validate the PUDO Click & Collect delivery options for product with only Standard parcel Options
      Given I navigate to "pDpParcelStandardOnlyAvailableUrl"
      Then I am in view of "deliveryOptionSection" on "pdpPage"
      And I should see "homeDeliveryOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionDisabled" exist on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOptionDisabled" exist on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£4.99" on "pdpPage"
      And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
      And I should see "internationalDeliveryOption" exist on "pdpPage"
      And I should see "internationalDeliveryMoreInfoLink" exist on "pdpPage"
      And I should see "pudoNonReturnMessaging" exist on "pdpPage"      

@automated @DEBD-3572  @DEBD-3221
Scenario: Validate the delivery options on pdp products when Click and Collect delivery option is not available but only Express parcel Options
      Given I navigate to "pDpParcelExpressOnlyAvailableUrl"
      Then I am in view of "deliveryOptionSection" on "pdpPage"
      And I should see "homeDeliveryOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOption" exist on "pdpPage"
      And I should see "pudoClickAndCollectOptionHeading" as "UK Click & Collect" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionDisabled" exist on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "Collect from store" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOption" containing "(Within 2 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectDebsOptionPrice" as "FREE" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOptionDisabled" exist on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOption" containing "(Within 5 working days)" on "pdpPage"
      And I should see "pudoClickAndCollectStandardParcelOptionPrice" as "£1.99" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "Collect from Hermes ParcelShop" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOption" containing "(Next day - order before 9pm)" on "pdpPage"
      And I should see "pudoClickAndCollectExpressParcelOptionPrice" as "£4.99" on "pdpPage"
      And I should see "pudoMoreInfoClickAndCollectLink" exist on "pdpPage"
      And I should see "internationalDeliveryOption" exist on "pdpPage"
      And I should see "internationalDeliveryMoreInfoLink" exist on "pdpPage"
      And I should see "pudoNonReturnMessaging" exist on "pdpPage"                   

@manual @DEBD-3572  @DEBD-3221
Scenario: Validate UI of delivery options as per design

@manual @DEBD-3572  @DEBD-3221
Scenario: Validate the delivery options on pdp product not available for Next and nominated day delivery
    Given I navigate to "pDpNextNomUnAvailableUrl"
    And I should see "disabledNextDayOption" exist on "pdpPage"
    And I should see "disabledNominatedDayOption" exist on "pdpPage"

@manual @DEBD-3572  @DEBD-3221
Scenario: Validate the delivery options on pdp product not available for Nominated day delivery
    Given I navigate to "pDpNomUnAvailableUrl"
    And I should not see "disabledNextDayOption" on "pdpPage"
    And I should see "disabledNominatedDayOption" exist on "pdpPage"    


@manual @DEBD-3299
Scenario: Validate the switch off functionality for PUDO(both standard and express delivery) on PDP page
   Given I navigate to "pDpDsPsAvailableUrl"
   And I am in view of "deliveryOptionSection" on "pdpPage"
   And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
   And I should see "clickAndCollectFirstoption" as "Collect from Store (within 2 working says) FREE" on "pdpPage"
   And I should see "disabledclickAndCollectSecondOption" exist on "pdpPage"
   And I should see "disabledclickAndCollectThirdOption" exist on "pdpPage"

@manual @DEBD-3300
Scenario: Validate the switch off functionality for PUDO(only express delivery) on PDP page
   Given I navigate to "pDpDsPsAvailableUrl"
   And I am in view of "deliveryOptionSection" on "pdpPage"
   And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
   And I should see "clickAndCollectFirstoption" as "Collect from Store (within 2 working says) FREE" on "pdpPage"
   And I should see "clickAndCollectSecondOption" exist on "pdpPage"
   And I should see "disabledclickAndCollectThirdOption" exist on "pdpPage"