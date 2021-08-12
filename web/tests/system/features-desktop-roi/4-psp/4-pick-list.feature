Feature: Test Debenhams pick list page validation

@automated @DEBD-230 @DEBD-769
Scenario: Navigate to desktop pick list and validate that there is no pagination
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  Given I navigate to "pickListPage"
  Then I should not see "paginationSectionHeader" on "pspPage"
  And I should not see "paginationSectionFooter" on "pspPage"
  And I should not see "NumberOfProductsLink" as "View No. products per page" on "pspPage"
  And I should not see "plpSlimBanner" on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should not see "filteredBy" on "pspPage"
  And I should see "totalCountOfProducts" exist on "pspPage"


@notautomated @DEBD-230
Scenario: Validate that the original pick list page is displayed on clicking Clear All link
  Given I navigate to "pickListPage"
  When I "validate and click" submenu option "Mango" from menu option "Brand" on "pspPage"
  Then I should not see "No Filters applied" on "pspPage"
  Then I should see "1stappliedfilter" as "Mango" on "pspPage"
  And I should see "selectedFilterCloseIcon" on "pspPage"
  When I click on "selectedFilterCloseIcon" on "pickListPage"
  And I should see "FilterBytext" as "No Filters applied..." on "pspPage"
  When I "validate and click" submenu option "PartyWear" from menu option "Ocassion" on "pspPage"
  Then I should not see "No Filters applied" on "pspPage"
  Then I should see "1stappliedfilter" as "PartyWear" on "pspPage"
  When I click on "clearAllLink" on "pickListPage"
  And I should see "FilterBytext" as "No Filters applied..." on "pspPage"

@manual @DEBD-230
Scenario: Validate the UI of pick list page
