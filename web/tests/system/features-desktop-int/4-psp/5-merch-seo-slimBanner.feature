Feature: Test Debenhams seo ,psp slim banner and merch content on psp Page

@automated @DEBD-325
Scenario: Validate the on the first PSP page the SEO content is displayed of the page with image and no hyperlink text
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I "validate & click" subMenu option "Dresses" under "Women" on commonPage bigscreen
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceLowHighAus" on "pspPage"
  Then I should see "url" contains "sid=*min_price_australia"
  And I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceHighLowAus" on "pspPage"
  Then I should see "url" contains "sid=-min_price_australia"
  And I should see "seoContent" exist on "pspPage"
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I "validate & click" subFilter option "Debut" under "Brand" on commonPage bigscreen
  Then I should not see "seoContent" on "pspPage"

@manual @DEBD-325 @DEBD-187
Scenario: Validate the position  and functionalty of each type of seo content on each type of pdp

@manual @DEBD-769
Scenario: Validate the psp slim banner on psp page
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I "validate & click" subMenu option "Duvets" under "Home" on commonPage bigscreen
  And I verify "href" of "pspSlimbannerLink" as "slimbanner" on "commonPage"
  Then I click on "pspSlimbannerLink" on "pspPage"
  And I wait for "5000" milliseconds
  And  I go back to previous page
  And I should scroll to "nextButton" on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I should see page number "2" of total on "pspPage"
  And I should see "pspSlimbanner" exist on "pspPage"
  Then I click on "nextButton" on "pspPage"
  And I should see page number "3" of total on "pspPage"
  And I should see "pspSlimbanner" exist on "pspPage"
  Then I click on "previousButtonState" on "pspPage"
  And I should see "pspSlimbanner" exist on "pspPage"
