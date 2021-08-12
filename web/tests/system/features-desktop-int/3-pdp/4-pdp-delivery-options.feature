Feature: Test Debenhams pdp page delivery options

@automated @PDP @DEBD-121 @dataNA
Scenario: Validate the delivery options on pdp products without deliuvery option
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  Given I navigate to "deliveryOptionsURLPDP1INT"
  Then I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "noDeliveryOptionsAvailableINT" exist on "pdpPage"
  And I should see "noDeliveryOptionsAvailableINT" as "Not available for delivery to selected country" on "pdpPage"

@automated @PDP @Fixed @DEBD-121
Scenario: Validate the delivery options on pdp products without deliuvery option
  Given I navigate to "deliveryOptionsURLPDP2INT"
  Then I am in view of "deliveryOptionSection" on "pdpPage"
  And I should see "deliveryOptionInternational" exist on "pdpPage"
  And I should see "deliveryOptionInternationalFistSubOption" as "Metro Areas" on "pdpPage"
  And I should see "deliveryOptionInternationalSecondSubOption" as "Rest of Australia" on "pdpPage"
  And I should see "deliveryOptionInternationalMoreInfoLink" exist on "pdpPage"
  And I should see "returnseSpotINT" exist on "pdpPage"
