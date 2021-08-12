Feature: Test Debenhams ops test script journey number 17

@automated @opsTC
Scenario: Validate that the auto suggestion options are appearing and are relevant
  Given I logout
  Then I should see "searchIcon" exist on "commonPage"
  And I wait for "5000" milliseconds
  And I click on "searchIcon" on "commonPage"
  And I enter "Pink" in "searchField" on "commonPage"
  Then I should see "autoSuggestions" exist on "commonPage"
  Then I should see "autoSuggestions" containing "pink" on "commonPage"

@automated @opsTC
Scenario: Validate that the auto suggestion appearing are relevant
  When I click on "searchApply" on "commonPage"
  Then I should see "url" contains "http://www.debenhams.com/search/Pink"

@automated @opsTC
Scenario: Validate that the user is able to select the filter button and expand the Brand facet using the '+' icon
  When I click on "filterButton" on "pspPage"
  Then I should see "closeIcon" exist on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I wait for "2000" milliseconds
  And I "validate" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Accurist" on "pspPage"
  And I "validate" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Yumi Girl" on "pspPage"
  And I "validate & click" option from "filterMenuList" of "Brand"  as "filterSubMenuViewList" as "View" on "pspPage"
  And I "validate" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Red Herring" on "pspPage"
  And I "validate" option from "filterMenuList" of "Brand"  as "filterSubMenuInputList" as "Phase Eight" on "pspPage"
  And I am in view of "filterTitle" on "pspPage"
  And I "validate & click" option is available in "filterMenuList" as "Brand" on "pspPage"

@automated @opsTC
Scenario: Validate that the user is able to select the filter button and expand the Brand facet using the '+' icon
  When I click to "expand" filter "Categories" position "1"
  And I click on position "8" "Toys" under parentfilter "1" "Categories"
  And I should see "url" contains "search/Pink/toys#filter"
  Then I click on "closeButton" on "pspPage"

@automated @opsTC
Scenario: Validate that the user is able to sort products on the psp page
  When I should see "sortOptionRelevanceDefault" exist on "pspPage"
  Then I click on "sortOptionName" on "pspPage"
  And I click on "headerText" on "pspPage"
  Then I should see "url" contains "sid=*name"

