Feature: Validate furnitures PDP

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

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








