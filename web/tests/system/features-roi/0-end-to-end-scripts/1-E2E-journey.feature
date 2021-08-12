Feature: Test Debenhams end to end journey number 1

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to homepage with a signout out user and validate the search icon with field and apply button
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Home sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "headerText" containing "Home" on "pspPage"
  # Then I should see "headerText" as "Home" on "pspPage"
  And I should see "url" contains "sale/home"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Joseph Joseph under Brand
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewCheckboxList" as "Joseph Joseph" on "pspPage"
  And I click on "closeButton" on "pspPage"
  And I should see "headerText" containing "Home" on "pspPage"
  And I should see "filterText" as "Joseph Joseph" on "pspPage"
  And I should see "url" contains "joseph-joseph#filter"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on brand room if search for Kat Von D
  When I click on "searchIcon" on "commonPage"
  And I enter "Kat Von D" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "url" contains "beauty/kvd-vegan-beauty"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user selected Lipstick under Categories on brand room of Kat Von D
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "brandRoomFilterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "brandRoomFilterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Make up" on "pspPage"
  Then I should see "headerText" containing "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/kvd-vegan-beauty"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user search for Gucci
  When I click on "searchIcon" on "commonPage"
  And I enter "Armani" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "url" contains "armani"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" containing "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "sale/women"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Shoes & boots wear under Categories
  When I click on "filterButton" on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Categories" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Categories"  as "filterSubMenuLinkList" as "Shoes & boots" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" containing "Women's shoes & boots" on "pspPage"
  And I should see "url" contains "sale/women/shoes-boots"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - Faith
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  Then I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  Then I should see "searchPanel" exist on "pspPage"
  When I am in view of "searchPanel" on "pspPage"
  And I enter "Faith" in "searchPanel" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "Faith" on "pspPage"
  And I click on "closeButton" on "pspPage"
  Then I should see "headerText" containing "Women's shoes & boots" on "pspPage"
  And I should see "filterText" as "Faith" on "pspPage"
  And I should see "url" contains "sale/women/shoes-boots/faith"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  When I set mvt test for "autoSuggest" as "variation1"
  Then I click on "searchIcon" on "commonPage"
  And I enter "Hat" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "womens hats"
  Then I should see "headerText" as ""womens hats"" on "pspPage"
  And I should see "url" contains "search/womens+hats"
