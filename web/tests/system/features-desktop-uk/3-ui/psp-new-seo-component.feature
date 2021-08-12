Feature: Test Debenhams new Espot seo content on EPSP Pages

@manual @DEBD-3936
Scenario: validate new Espot seo content on EPSP Pages
  Given I logout
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses#intcmp-topnav-womenddn-heading-Clothing-link-Dresses"
  And I should see "seocopy" exist on "pspPage"
  And I should see "NewPspConent" exist on "pspPage"
  And I should see "7 Fix CTAs" in "Below SEO Copy" on "pspPage"
  And I should not see "HeroBanner" on "pspPage"
  And I should see only single line text below CTA text


@manual @DEBD-3936
Scenario: validate new Espot seo content on EPSP Pages redirecting to correct PSP when clicked
  When I click on "1stCTA"
  Then I should be redirected to the 1st CTA pspPage
  Then I should see "headerText" as "1stCTAText" on "pspPage"
  And I should see "url" contains "/women/1stCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "2ndCTA"
  Then I should be redirected to the 1st CTA pspPage
  Then I should see "headerText" as "2ndCTAText" on "pspPage"
  And I should see "url" contains "/women/2nsCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "3rdCTA"
  Then I should be redirected to the 3rdCTAText pspPage
  Then I should see "headerText" as "3rdCTAText" on "pspPage"
  And I should see "url" contains "/women/3rdCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "4thCTA"
  Then I should be redirected to the 4thCTA pspPage
  Then I should see "headerText" as "4thCTAText" on "pspPage"
  And I should see "url" contains "/women/4thCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "5thCTA"
  Then I should be redirected to the 5thCTA pspPage
  Then I should see "headerText" as "5thCTA" on "pspPage"
  And I should see "url" contains "/women/5thCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "6thCTA"
  Then I should be redirected to the 6thCTA pspPage
  Then I should see "headerText" as "6thCTA" on "pspPage"
  And I should see "url" contains "/women/6thCTA"
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "7thCTA"
  Then I should be redirected to the 7thCTA pspPage
  Then I should see "headerText" as "7thCTA" on "pspPage"
  And I should see "url" contains "/women/7thCTA"
