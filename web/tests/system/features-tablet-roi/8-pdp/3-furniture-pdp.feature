Feature: Test Debenhams Dotie pdp furniture validation

@manual @DBMTE-632
Scenario: Navigate to furniture pdp page and validate product gets change when fabric color is changed
  Given I logout
  And I navigate to "testFurniturePdpURL"
  When I click on "changeSelectedFabric" on "pdpPage"
  Then I should see "colorListHeaderText" as "Choose Fabric" on "pdpPage"
  When I change "SelectedFabric" the product changes on "pdpPage"

@manual @DBMTE-632
Scenario: Validate product gets change when feet color is changed
  When I click on "changeSelectedFeet" on "pdpPage"
  Then I should see "colorListHeaderText" as "Choose Feet" on "pdpPage"
  When I change "SelectedFeet" the product changes on "pdpPage"

@manual @DBMTE-632
Scenario: Validate swatches ordered when user enters address and selects a swatch
  When I click on "orderSwatchesLink" on "pdpPage"
  Then I should see "colorListHeaderText" as "Order FREE Swatches" on "pdpPage"
  And I should see "orderSwatchFirstOption" exist on "pdpPage"
  And I should see "orderSwatchesButton" exist on "pdpPage"
  And I should not see "noSwatchSelectedError" on "pdpPage"

@manual @DBMTE-632
Scenario: Validate error message when selected order swatch button without selecting swatch
  When I am in view of "orderSwatchesButton" on "pdpPage"
  And I click on "orderSwatchesButton" on "pdpPage"
  Then I should see "noSwatchSelectedError" as "No swatches selected - Please select a swatch from the options below before continuing" on "pdpPage"

@manual @DBMTE-632
Scenario Outline: Validate swatchis ordered when user enters address and selects a swatch
  Then I click on "orderSwatchFirstOption" on "pdpPage"
  When I am in view of "orderSwatchFirstName" on "pdpPage"
  And I should see "orderSwatchFirstName" exist on "pdpPage"
  And I should see "orderSwatchLastName" exist on "pdpPage"
  And I should see "orderSwatchEmail" exist on "pdpPage"
  And I should see "orderSwatchHouseNo" exist on "pdpPage"
  And I should see "orderSwatchAddressLine1" exist on "pdpPage"
  And I should see "orderSwatchAddressLine2" exist on "pdpPage"
  And I should see "orderSwatchCity" exist on "pdpPage"
  And I should see "orderSwatchPostcode" exist on "pdpPage"
  When I enter "<firstName>" in "orderSwatchFirstName" on "pdpPage"
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

  Examples:
    | firstName | lastName | email   | houseNumber | addressLine1 | addressLine2 | city   | postcode |
    | Vishal    | Malhotra | a@a.com | Test        | Address      | Line         | Dublin | D01 A3T6 |
