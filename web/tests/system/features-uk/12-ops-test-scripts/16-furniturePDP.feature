Feature: Test Debenhams ops test script journey number 24

@manual @opsTC
Scenario:Validate furniture PDP page as per opsTC-24
  Given I logout
  Then I navigate to "furnitureUrl"
  And I should see "productDimensions" exist on "pdpPage"
  And I should see "selectedFabricSection" exist on "pdpPage"
  Then I click on "selectedFabricSection" on "pdpPage"
  And I should see "selectedFeetSection" exist on "pdpPage"
  Then I click on "selectedFeetSection" on "pdpPage"
