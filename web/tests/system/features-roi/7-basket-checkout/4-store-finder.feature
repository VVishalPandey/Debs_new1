Feature: Test Debenhams store finder page

@manual @DDAI-215
Scenario: Navigate to Debenhams store page
  Given I navigate to "homeURL"
  When I click on "menuIcon" on "commonPage"
  Then I "validate & click" option is available in "mainMenuList" as "Store Finder" on "commonPage"
