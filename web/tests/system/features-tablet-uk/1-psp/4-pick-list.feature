Feature: Test Debenhams pick list page validation

@automated @Fixed @DBMTE-144
Scenario: Navigate to Debenhams Multi select plp page and validate the page
  Given I navigate to "multiwayCollectionPspUrl"
  Then I should see "headerText" as "The multiway collection" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPriceNew" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"

@automated @Fixed @DBMTE-144
Scenario: Navigate to Debenhams Beauty plp page and validate the page
  Given I navigate to "plpPspPage"
  Then I should see "headerText" as "Trend: Animal print" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPriceNew" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"

@manual @DBMTE-144
Scenario: Navigate to Debenhams Beauty plp page and validate that there is no pagination

@manual @DBMTE-144
Scenario: Navigate to Debenhams Beauty plp page and validate coloumn and non-column view

@manual @DBMTE-144
Scenario: Navigate to Debenhams Beauty plp page and validate filterButton

@manual @DBMTE-144
Scenario: Navigate to Debenhams Beauty plp page and validate the products from desktop
