Feature: Test Debenhams pdp page delivery options


@automated @PDP @Fixed @DEBD-121
Scenario Outline: Validate the delivery options on pdp products having Standard Home Delivery And Click & Collect Delivery Options
  Given I navigate to "<pdpURL>"
  Then I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "homeDeliverySecondSubOption" as "Next Day Delivery" on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
  And I should see "clickAndCollectFistSubOption" as "Click & Collect (FREE on all orders)" on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"


Examples:
    | pdpURL                   |
    | deliveryOptionsURLPDP3   |
    | deliveryOptionsURLPDP4   |
    | deliveryOptionsURLPDP5   |

@automated @PDP @Fixed @DEBD-121
Scenario Outline: Validate the delivery options on pdp products having only Standard Home Delivery Option with Only Standard Sub-Option
  Given I navigate to "<pdpURL>"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "disabledHomeDeliverySecondSubOption" exist on "pdpPage"
  And I should see "disabledHomeDeliveryThirdSubOption" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "disabledClickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"


Examples:
    | pdpURL                   |
    | deliveryOptionsURLPDP1   |
    | deliveryOptionsURLPDP2   |

@automated @PDP @Fixed @DEBD-121
Scenario: Validate the delivery options on pdp products having only Standard Home Delivery Option with Standard And Click & Collect Delivery Option
  Given I navigate to "deliveryOptionsURLPDP6"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "Standard home delivery" on "pdpPage"
  And I should see "disabledHomeDeliverySecondSubOption" exist on "pdpPage"
  And I should see "disabledHomeDeliveryThirdSubOption" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOption" exist on "pdpPage"
  And I should see "clickAndCollectDeliveryOptionHeader" as "Click & Collect" on "pdpPage"
And I should see "clickAndCollectFistSubOption" as "Click & Collect (FREE on all orders)" on "pdpPage"
  And I should see "clickAndCollectMoreInfoLink" exist on "pdpPage"
  And I should see "disabledInternationalDeliveryOption" exist on "pdpPage"

@automated @DEBD-121 @dataNA
Scenario: Validate the delivery options on pdp products not having Standard Home Delivery, Made To Order And Delivery & Assembly Option
  Given I navigate to "deliveryOptionsURLPDP7"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  And I should see "homeDeliveryOptionHeader" as "Standard Home Delivery" on "pdpPage"
  And I should see "disabledHomeDeliverySecondSubOption" exist on "pdpPage"
  And I should see "disabledHomeDeliveryThirdSubOption" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "madeToOrderDeliveryOption" exist on "pdpPage"
  And I should see "madeToOrderDeliveryOptionHeader" as "Made to order" on "pdpPage"
  And I should see "madeToOrderDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOption" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOptionHeader" as "Delivery & Assembly information" on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryMoreInfoLink" exist on "pdpPage"

@automated @DEBD-121  @dataNA
Scenario Outline: Validate the delivery options on pdp products having Standard Home Delivery And Delivery & Assembly And not having Made To Order Option
  Given I navigate to "<pdpURL>"
  And I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "homeDeliveryOption" exist on "pdpPage"
  And I should see "homeDeliveryOptionHeader" as "Standard Home Delivery" on "pdpPage"
  And I should see "homeDeliveryFistSubOption" as "6 weeks" on "pdpPage"
  And I should not see "homeDeliverySecondSubOption" on "pdpPage"
  And I should not see "homeDeliveryThirdSubOption" on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOption" exist on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryOptionHeader" as "Delivery & Assembly information" on "pdpPage"
  And I should see "deliveryAndAssemblyDeliveryMoreInfoLink" exist on "pdpPage"
  And I should not see "madeToOrderDeliveryOption" on "pdpPage"

   Examples:
    | pdpURL                  |
    | deliveryOptionsURLPDP8  |
    | deliveryOptionsURLPDP9  |
