Feature: Test Debenhams pick list page validation

@automated @Fixed @DEBD-230 @DEBD-769
Scenario: Navigate to desktop pick list and validate that there is no pagination
  Given I navigate to "plpPspPage"
  Then I should see "url" contains "plp/anml-ltrend"
  And I should not see "paginationSectionHeader" on "pspPage"
  And I should not see "paginationSectionFooter" on "pspPage"
  And I should not see "NumberOfProductsLink" as "View No. products per page" on "pspPage"
  And I should not see "plpSlimBanner" on "pspPage"
  # And I should see "seoContainer" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"
  And I should not see "filteredBy" on "pspPage"
  #And I should see "totalCountOfProducts" exist on "pspPage"

@notautomated @DEBD-230 @awsManual
Scenario: Validate that the original pick list page is displayed on clicking Clear All link
  Given I navigate to "pickListPage"
  And I "validate & click" subFilter option "Slim fit" under "Fit" on commonPage bigscreen
  Then I should see "url" contains "/slim-fit-1#filter"
  Then I should not see "No Filters applied" on "pspPage"
  Then I should see "1stappliedfilter" as "Long" on "pspPage"
  And I should see "selectedFilterCloseIcon" on "pspPage"
  When I click on "selectedFilterCloseIcon" on "pickListPage"
  And I should see "FilterBytext" as "No Filters applied..." on "pspPage"
  When I "validate & click" subFilter option "QUIZMAN" under "Brand" on commonPage bigscreen
  Then I should not see "No Filters applied" on "pspPage"
  Then I should see "1stappliedfilter" as "QUIZMAN" on "pspPage"
  Then I should see "url" contains "/quizman#filter"
  When I click on "clearAllLink" on "pickListPage"
  And I should see "FilterBytext" as "No Filters applied..." on "pspPage"
  And I should see "secondBreadcrumb" as "Party Players: Printed Shirts" on "pspPage"
  #And I second breadcrumb is not clickable

@manual @DEBD-230
Scenario: Validate the UI of pick list page
