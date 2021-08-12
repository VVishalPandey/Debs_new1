Feature: Test Debenhams Customer Enactment end to end journey number 1 for CCC Users

@automatedSanity @preprodSanity @e2e
Scenario: Set the mobify cookie & navigate to homepage with a signout out user and validate the search icon with field and apply button
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  And I navigate to "homeURL"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  Then I should see "searchField" exist on "commonPage"
  And I should see "searchApply" exist on "commonPage"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Hat" in "searchField" on "commonPage"
  Then I select the auto search department as "beanie hat"
  Then I should see "headerText" as ""beanie hat"" on "pspPage"
  And I should see "url" contains "search/beanie+hat"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "ladies"
  Then I should see "headerText" as ""ladies hats"" on "pspPage"
  And I should see "url" contains "search/ladies+hats"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Home Sale
  And I enter "Home sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Home" on "pspPage"
  And I should see "url" contains "sale/home"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Joseph Joseph under Brand
  When I am in view of "headerText" on "pspPage"
  When I "validate & click" subFilter option "Joseph Joseph" under "Brand" on commonPage bigscreen
  Then I should see "headerText" as "Home" on "pspPage"
  And I should see "searchText" as "Joseph Joseph" on "pspPage"
  And I should see "url" contains "sale/home/joseph-joseph"


@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on brand room if search for Kat Von D
  When I click on "searchIcon" on "commonPage"
  And I enter "Kat Von D" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  #Then I should see "headerText" as "Beauty" on "pspPage"
  And I should see "url" contains "beauty/kat-von-d"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user selected Make up under Categories on brand room of Kat Von D
  When I "validate & click" subFilter option "Make up" under "Categories" on commonPage bigscreen
  Then I should see "headerText" as "Makeup" on "pspPage"
  And I should see "url" contains "beauty/make-up/kat-von-d"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on TCAT Page if search for Men
  When I click on "searchIcon" on "commonPage"
  And I enter "Men" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  And I should see "tcatHeaderText" containing "Men's clothing & accessories" on "pspPage"
  And I should see "url" contains "/men"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user search for Gucci
  When I click on "searchIcon" on "commonPage"
  And I enter "Gucci" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "searchText" as "GUCCI" on "pspPage"
  And I should see "headerText" containing "Beauty" on "pspPage"
  And I should see "url" contains "gucci"

@automatedSanity @preprodSanity @e2e
Scenario: Validate that user lands on SCAT if search for Women sale
  When I click on "searchIcon" on "commonPage"
  And I enter "Women sale" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should see "headerText" as "Women's clothing & accessories" on "pspPage"
  And I should see "url" contains "sale/women"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result when user choose Shoes & boots under Categories
  When I click on "filterButton" on "pspPage"
  When I "validate & click" subFilter option "Shoes & boots" under "Categories" on commonPage bigscreen
  Then I should see "headerText" as "Women's shoes & boots" on "pspPage"
  And I should see "url" contains "/sale/women/shoes-boots"

@automatedSanity @preprodSanity @e2e
Scenario: Validate the search result psp page when user apply filter Brand - Phase Eight
  When I click on "filterButton" on "pspPage"
  When I "validate & click" subFilter option "View all Brands" under "Brand" on commonPage bigscreen
  Then I should see "searchPanel" exist on "pspPage"
  When I am in view of "searchPanel" on "pspPage"
  And I enter "Phase Eight" in "searchPanel" on "pspPage"
  When I "validate & click" subFilter option "Phase Eight" under "Brand" on commonPage bigscreen
  Then I should see "headerText" as "Women's shoes & boots" on "pspPage"
  And I should see "searchText" as "Phase Eight" on "pspPage"
  And I should see "url" contains "/sale/women/shoes-boots/phase-eight"
