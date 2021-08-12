Feature: Test Debenhams pdp page delivery options

@automated @PDP @Fixed @DEBD-121
Scenario Outline: Validate the delivery options on pdp products having all the Delivery Options
  Given I navigate to "<pdpURL>"
  Then I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  # And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "homeDeliverySecondSubOption" as "Next Day delivery" on "pdpPage"
  And I should see "homeDeliveryThirdSubOption" as "Nominated Day" on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
  #And I should see "clickAndCollectFistSubOption" as "Next day store delivery" on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "internationalDeliveryOption" exist on "pdpPage"
  And I should see "internationalDeliveryOptionHeader" as "International delivery" on "pdpPage"
  And I should see "internationalDeliveryMoreInfoLink" exist on "pdpPage"

Examples:
    | pdpURL                   |
    | deliveryOptionsURLPDP1   |
    | deliveryOptionsURLPDP2   |

@automated @PDP @Fixed @DEBD-121
Scenario: Validate the delivery options on pdp products having only Home Delivery Option with Only Standard Sub-Option
  Given I navigate to "deliveryOptionsURLPDP3"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  # And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "disabledHomeDeliverySecondSubOption" exist on "pdpPage"
  And I should see "disabledHomeDeliverySecondSubOption" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "disabledClickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"


@automated @PDP @Fixed @DEBD-121
Scenario Outline: Validate the delivery options on pdp products having only Home Delivery Option with Standard & Next Day Sub Option
  Given I navigate to "<pdpURL>"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  # And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "homeDeliverySecondSubOption" as "Next Day delivery" on "pdpPage"
  And I should see "disabledHomeDeliveryThirdSubOption" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "disabledClickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"

  Examples:
    | pdpURL                   |
    | deliveryOptionsURLPDP4   |
    | deliveryOptionsURLPDP6   |


@automated @PDP @Fixed @DEBD-121
Scenario: Validate the delivery options on pdp products not having International Delivery Option
  Given I navigate to "deliveryOptionsURLPDP5"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  # And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "homeDeliverySecondSubOption" as "Next Day delivery" on "pdpPage"
  And I should see "homeDeliveryThirdSubOption" as "Nominated Day" on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
  #And I should see "clickAndCollectFistSubOption" as "Next day store delivery" on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"

@automated @PDP @Fixed @DEBD-121
Scenario: Validate the delivery options on pdp products not having Home Delivery, Made To Order And Delivery & Assembly Option
  Given I navigate to "deliveryOptionsURLPDP7"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOptionFurniture" exist on "pdpPage"
  And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "furnitureHomeDeliveryFistSubOption" as "3 weeks" on "pdpPage"
  And I should not see "homeDeliverySecondSubOption" on "pdpPage"
  And I should not see "homeDeliveryThirdSubOption" on "pdpPage"
  And I should see "furnitureHomeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "madeToOrderDeliveryOption" exist on "pdpPage"
  And I should see "madeToOrderDeliveryOptionHeader" as "Made to order" on "pdpPage"
  And I should see "madeToOrderDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOption" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOptionHeader" as "Delivery & Assembly information" on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryMoreInfoLink" exist on "pdpPage"

@automated @PDP @Fixed @DEBD-121
Scenario Outline: Validate the delivery options on pdp products having Home Delivery & Delivery & Assembly And not having Made To Order Option
  Given I navigate to "<pdpURL>"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOptionFurniture" exist on "pdpPage"
  #And I should see "homeDeliveryOptionHeader" as "Home Delivery" on "pdpPage"
  And I should see "furnitureHomeDeliveryFistSubOption" as "4 weeks" on "pdpPage"
  And I should not see "homeDeliverySecondSubOption" on "pdpPage"
  And I should not see "homeDeliveryThirdSubOption" on "pdpPage"
  And I should see "furnitureHomeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should not see "deliveryAndAssemblyDeliveryOption" on "pdpPage"
  And I should not see "deliveryAndAssemblyDeliveryOptionHeader" on "pdpPage"
  And I should not see "deliveryAndAssemblyDeliveryMoreInfoLink" on "pdpPage"
  And I should not see "madeToOrderDeliveryOption" on "pdpPage"

   Examples:
    | pdpURL                  |
    #| deliveryOptionsURLPDP8  |
    | deliveryOptionsURLPDP9  |
