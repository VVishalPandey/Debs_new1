Feature: Test Debenhams seo ,psp slim banner and merch content on psp Page

@automated @DEBD-923
Scenario: Validate the on the first PSP page the SEO content is displayed of the page with image and no hyperlink text
  Given I navigate to "homeUKURL"
  Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  Then I should see "headerText" containing "Dresses" on "pspPage"
  Then I should see "pspHeader" as "Maxi Dresses" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceLowHighIE" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "sortOptionPriceHighLowIE" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  When I click on "productViewPerPageLink" on "pspPage"
  Then I should see "seoContent" exist on "pspPage"
  And I "validate & click" subFilter option "€55 and over" under "Price" on commonPage bigscreen
  Then I should see "url" contains "price%3E55.0"
  And I should see "headerText" containing "Dresses" on "pspPage"
  And I should see "pspHeader" as "Maxi dresses, €55 and over" on "pspPage"
  And I should not see "seoContent" on "pspPage"
  When I "validate & click" subMenu option "Maxi dresses" under "Women" on commonPage bigscreen
  And I should see "seoContent" exist on "pspPage"
  When I "validate & click" subFilter option "Mela London" under "Brand" on commonPage bigscreen
  Then I should not see "seoContent" on "pspPage"


@manual @DEBD-924 @DEBD-923
Scenario: Validate the position  and functionalty of each type of seo content on each type of pdp


@notAutomated @DEBD-924
Scenario: Validate the psp slim banner on psp page
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I "validate & click" subMenu option "Duvets" under "Home" on commonPage bigscreen
  And I verify "href" of "pspSlimbannerLink" as "slimbanner" on "commonPage"
  Then I click on "pspSlimbannerLink" on "pspPage"
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







