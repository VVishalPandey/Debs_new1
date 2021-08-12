Feature: Validate furnitures PDP

@automated @PDP @Fixed @DBED-544 @DEBD-105
Scenario: Navigate to Sofa beds PDP and validate changing colour swatches for fabric and feet
    Given I navigate to "SofabedsPdpUrl"
    Then I should see "selectedFabricColor" exist on "pdpPage"
    And I should see "selectedFeetColor" exist on "pdpPage"
    And I should see "changeSelectedFabric" exist on "pdpPage"
    And I should see "changeSelectedFeet" exist on "pdpPage"
    And I click on "changeSelectedFabric" on "pdpPage"

@automated @PDP @Fixed @DEBD-544
Scenario: Navigate to Sofa beds PDP and validate Fabric and Feet tabs
    Then I should verify "activeTab" "rgba(0, 179, 158, 1)" to be highlighted "background-color" on "pdpPage"
    And I should see "fabricTabHeadings" exist on "pdpPage"
    And I click on "changeSelectedFeet" on "pdpPage"
    And I should see "feetOptions" exist on "pdpPage"
    #Then I should verify "activeTab" "rgba(0, 179, 158, 1)" to be highlighted "background-color" on "pdpPage"

@automated @PDP @Fixed @DEBD-544
Scenario: Validate furnitre PDP navigation behavior on Fabric change
  Then I click on "changeSelectedFabric" on "pdpPage"
  And I change "SelectedFabric" the product changes on "pdpPage"
  #Then I should be taken to the main image of same PDP

@automated @PDP @Fixed @DEBD-544
Scenario: Validate furnitre PDP navigation behavior on Feet change
  Then I click on "changeSelectedFeet" on "pdpPage"
  And I change "SelectedFeet" the product changes on "pdpPage"
  #Then I should be taken to the main image of same PDP

@notAutomated @DEBD-544 @awsManual
Scenario: Validate of Fabric Tab hover functionality on Furniture PDP
    When I should see "Fabric tab" exist on "pdpPage"
    And I "Validate and hover" on "? icon" exist on "pdpPage"
    Then I should see "informationtooltip" on "pdpPage"
    And I should see "price by fabric category" exist on "pdpPage"
    And I should see "color name" exist on "pdpPage"
    And I should see "DeliveryLeadtime" exist on "pdpPage"
    When I "validate and Hover" on "Fabric swatch" on "pdpPage"
    Then I should see "tooltip" on "pdpPage"
    And I should see "imagezoom" on "pdpPage"
    And I should see "Color name" on "pdpPage"
    And I should see "fabricname" on "pdpPage"
    And I "validate and click" on "orderswatches" on "pdpPage"
    Then I should see "order swatches overlay" on "pdpPage"

@automated @PDP @Fixed @DEBD-544 @DEBD-105 @defectDEBD-2648
Scenario: Navigate to Sofa beds PDP and validate order swatches form validation
  When I click on "orderSwatchesLink" on "pdpPage"
  Then I should see "colorListHeaderText" as "Order FREE Swatches" on "pdpPage"
  And I should see "orderSwatchFirstOption" exist on "pdpPage"
  And I should see "orderSwatchesButton" exist on "pdpPage"
  And I should not see "noSwatchSelectedError" on "pdpPage"

@automated @PDP @Fixed @DEBD-105
Scenario: Validate error message when selected order swatch button without selecting swatch
  When I am in view of "orderSwatchesButton" on "pdpPage"
  And I click on "orderSwatchesButton" on "pdpPage"
  Then I should see "noSwatchSelectedError" containing "No swatches selected - Please select a swatch from the options below before continuing" on "pdpPage"

@automated @PDP @Fixed @DEBD-105
Scenario Outline: Validate swatchis ordered when user enters address and selects a swatch
  Then I click on "orderSwatchFirstOption" on "pdpPage"
  When I am in view of "orderSwatchFirstName" on "pdpPage"
  And I enter "<firstName>" in "orderSwatchFirstName" on "pdpPage"
  And I enter "<lastName>" in "orderSwatchLastName" on "pdpPage"
  And I enter "<email>" in "orderSwatchEmail" on "pdpPage"
  And I enter "<houseNumber>" in "orderSwatchHouseNo" on "pdpPage"
  And I enter "<addressLine1>" in "orderSwatchAddressLine1" on "pdpPage"
  And I enter "<addressLine2>" in "orderSwatchAddressLine2" on "pdpPage"
  And I enter "<city>" in "orderSwatchCity" on "pdpPage"
  And I enter "<postcode>" in "orderSwatchPostcode" on "pdpPage"
  When I am in view of "orderSwatchesButton" on "pdpPage"
  #And I click on "orderSwatchesButton" on "pdpPage"
  #Then I should see "orderSwatchConfirmSection" exist on "pdpPage"
  #And I should see "orderSwatchConfirmContinueButton" exist on "pdpPage"
  #And I should see "orderSwatchConfirmText" as "Your swatches have been ordered" on "pdpPage"
  #And I should see "orderSwatchConfirmDeliveryText" as "We will deliver them within 3-5 working days" on "pdpPage"
  #Then I click on "orderSwatchConfirmContinueButton" on "pdpPage"

  Examples:
    | firstName | lastName | email                     | houseNumber | addressLine1      | addressLine2           | city   | postcode |
    | Vishal    | Malhotra | vmalhotra9918@sapient.com | Flat 31     | The Lock Building | High Street, Stratford | London | E152QB   |

@manual @DEBD-544 @awsManual
Scenario: Validate Furniture PDP for Fabric and Feet UI
  Given I am on a larger viewport (1441+)
  Then I will see a maximum of 7 fabric swatchers per row
  When I am on a smaller viewport (1024-1440)
  Then I will see a maximum of 6 fabric swatchers per row
  And If we have more than 7 swatches
  Then the swatchers will wrap
  When I'm on the fabric Tab
  Then it should be highlighted in teal with a teal bottom border
  And Fabric categories should be split by deviders
  When I click on another  swatch within the same or another  fabric category
  Then  it will get an orange border
  And orange drop shadow
  And  I will be taken to the main image on the PDP page
  And  the main image and thumbnails will change to reflect the new colour
  And  I should see  selected fabric colour
  When I'm on Feet Tab
  Then I should see the feet tab highlighted in teal with a teal bottom border
  And I should see "dark wood swatch"
  And I should see "light wood swatch"
  And I should see the selected swatch highlighted in orange
  When I click on the other swatch
  Then  it will get an orange border
  And  orange drop shadow
  And I will be taken to the main image on the PDP page
  And the main image and thumbnails will change to reflect the new feet colour
  And the selected feet colour will update

@manual @DEBD-105   @awsManual
Scenario: Navigate to Sofa beds PDP, and validate the funtiure pdp links and CTA
  Given I navigate to "SofabedsPdpUrl"
  Then  I should see "Full discription link" on "pdpPage"
  And I should see "Furnituredescritionsection" on "pdpPage"
  And I validate  "xx" weeks delivery more details link
  And I validate More details link in delivery section is redirecting to FAQ page
  And I should see "SaveForLater" text
  And I should not see "Save for later" icon
  And I should see "returnespot"
  And I should see "featured espot"
  And I should see "orderswatches espot"
  And I validate "Delivery and assembly information"
  And I validate "Also in the range" & "Style it with" below "Fabric and Feet"
  When I clicked on the first product in the ‘Also in the range’ carousel

@manual @DEBD-105 @awsManual
Scenario: Validate that correct fabric and feet colour are displayed on my bag and mini bag page
  Then I should be navigated to "sofabedsURL"
  Then I click on "changeSelectedFabric" on "pdpPage"
  And I change "SelectedFabric" the product changes on "pdpPage"
  Then I click on "changeSelectedFeet" on "pdpPage"
  And I change "SelectedFeet" the product changes on "pdpPage"
  Then I click on "addToBag" on "pdpPage"
  And I navigate to my bag page
  Then I verify the same colour fabric and feet in displayed for the furniture as selected on PDP page
  Then I validate the same colour fabric and feet in displayed for the furniture as selected on PDP page








