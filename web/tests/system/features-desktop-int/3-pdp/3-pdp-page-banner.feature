Feature: Test Debenhams pdp page banner

@manual @DEBD-110
Scenario: Navigate to PDP of dior backstage and validate the pdp banner and its navigation when clicked on it
  Given I navigate to "diorBackstagePdpUrl"
  Then I should see "pdpBanner" exist on "pdpPage"
  When I click on "pdpBanner" on "pdpPage"
  And I should see "url" contains "/content/dior-backstage"
