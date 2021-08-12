Feature: Test Debenhams seo ,psp slim banner and merch content on psp Page

@automated @Fixed @DEBD-325
Scenario: Validate the on the first PSP page the SEO content is displayed of the page with image and no hyperlink text
  Given I navigate to "homeURL"
  When I "validate & click" subMenu option "Wedding guest dresses" under "Women" on commonPage bigscreen
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I "validate & click" subFilter option "£50 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E50.0"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Wedding guest, £50 and over" on "pspPage"
  And I should not see "seoContent" on "pspPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I "validate & click" subFilter option "Dorothy Perkins" under "Brand" on commonPage bigscreen
  Then I should not see "seoContent" on "pspPage"

@notAutomated @DEBD-325 @awsManual
Scenario: Validate the on the first PSP page the SEO content is displayed of the page with image and hyperlink text
  Given I navigate to "womenDressesPspUrl"
  Then I should see "seoContent" exist on "pspPage"
  And I should see "seoPspLinks" as "Example: New dresses Midi dresses Plus size dresses" on "pspPage"
  Then I click on "seoPspLink1" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "Example: /women/new-arrivals-clothing/dresses#intcmp=dresses_new_dresses"
  And  I should not see "seoContent"on "pspPage"
  Then I go back to previous page

@notAutomated @DEBD-325
Scenario: Validate the on the first PSP page the SEO content is displayed of the page with image and CTA
  Given I navigate to "womenDressesPspUrl"
  Then I should see "seoContent" exist on "pspPage"
  And I should see "CTA" as "Shop Now" on "pspPage"
  Then I click on "CTA" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "Example: /women/new-arrivals-clothing/dresses#intcmp=dresses_new_dresses"
  And  I should see "seoContent1"on "pspPage"

@notAutomated @DEBD-325 @awsManual
Scenario: Navigate to desktop pick list and validate SEO functionality
  Given I navigate to "pickListPage"
  Then I should see "seoContent" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  When I click on "sortOptionPriceLowHigh" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceHighLow" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "NumberOfProductsLink" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  And I enter "10" in "priceFrom" on "pspPage"
  And I enter "30" in "priceTo" on "psppage"
  And I click "Searchbutton" on "pspPage"
  Then I should not see "seoContent"  on "pspPage"
  Then I go back to previous page
  And I should see "seoContent" exist on "pspPage"
  Then I "validate and click" submenu option "Mango" from menu option "Brand" on "pspPage"
  Then I should not see "seoContent"  on "pspPage"
  Then I go back to previous page
  And I should see "seoPspLinks" as "Example: New dresses Midi dresses Plus size dresses" on "pspPage"
  Then I click on "seoPspLink1" on "pspPage"
  And I wait for "5000" milliseconds
  Then I should see "url" contains "Example: /women/new-arrivals-clothing/dresses#intcmp=dresses_new_dresses"
  And  I should not see "seoContent"on "pspPage"

@notAutomated @DEBD-187
Scenario: Validate the on the first PSP page the SEO content is displayed with text and no links
  Given I navigate to "womenDressesPspUrl"
  When I click on "NumberOfProductsLink" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  Then I "validate and click" submenu option "Mango" from menu option "Brand" on "pspPage"
  Then I should not see "seoContent"  on "pspPage"

@notAutomated @DEBD-187 @awsManual
Scenario: Validate the on the first PSP page the SEO content is displayed with text  links having facet value
  Given I navigate to "womenDressesPspUrl"
  Then I should see "seoContent" exist on "pspPage"
  And I should see "Textlink" as "Red" on "pspPage"
  Then I click on "Textlink" on "pspPage"
  And I should see "url" contains "Red"
  Then I should see "1stappliedfilter" as "PartyWear" on "pspPage"
  Then I should not see "seoContent"  on "pspPage"

@manual @DEBD-325 @DEBD-187
Scenario: Validate the position of each type of seo content on each type of pdp

@automated @Fixed @DEBD-769
Scenario: Validate the psp slim banner on psp page with pagination
  When I "validate & click" subMenu option "Lipstick" under "Beauty" on commonPage bigscreen
  Then I should see "pspSlimbanner" exist on "pspPage"
  And I verify "href" of "pspSlimbannerLink" as "slimbanner" on "pspPage"
  Then I click on "pspSlimbannerLink" on "pspPage"
  #Then I should see "url" contains "Example: /beauty"
  And  I go back to previous page
  When I click on "nextButton" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "pspSlimbanner" exist on "pspPage"
  When I click on "previousButtonState" on "pspPage"
  Then I should see page number "1" of total on "pspPage"
  And I should see "pspSlimbanner" exist on "pspPage"
