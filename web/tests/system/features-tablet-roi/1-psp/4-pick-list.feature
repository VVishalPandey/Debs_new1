Feature: Test Debenhams Dotie pick list page validation

@manual @DBMTE-669
Scenario: Navigate to Debenhams Multi select plp page and validate the page
  Given I navigate to "plpMultiSelectUrl"
  Then I should see "headerText" as "The multiway collection" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPriceNew" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"

@manual @DBMTE-669
Scenario: Navigate to Debenhams Beauty plp page and validate the page
  Given I navigate to "plpBeautyUrl"
  Then I should see "headerText" as "New In" on "pspPage"
  And I should see "filterButton" exist on "pspPage"
  And I should not see "sortDropdown" exist on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"
  Then I should see "imagesOnScreen" exist on "pspPage"
  And I should see "productShortDescription" exist on "pspPage"
  And I should see "productPriceNew" exist on "pspPage"
  And I should see "saveForLaterButton" exist on "pspPage"
  And validate that there is no pagination

@manual @DBMTE-669
Scenario: Navigate to Debenhams Beauty plp page and validate filter when applied on brand Kat Von D and validate result from desktop

@manual @DBMTE-669
Scenario: Navigate to Debenhams The multiway collection plp page and validate filter when applied on cateroy women and brand maxi dresses and validate result from desktop
