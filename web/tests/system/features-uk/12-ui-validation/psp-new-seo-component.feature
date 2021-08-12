Feature: Test Espot seo content on EPSP Pages

@manual @DEBD-3936
Scenario: validate new Espot seo content on EPSP Pages
  Given I logout
  When I "validate & click" subMenu option "Tops" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Tops" on "pspPage"
  And I should see "url" contains "/women/Tops#intcmp-topnav-womenddn-heading-Clothing-link-Tops"
  And I should see "seocopy" exist on "pspPage"
  And I should see "NewPspConent" exist on "pspPage"
  And I should see "2.5 CTA" below "SEO copy" on "pspPage"
  And I should see scrollableCTA's
  And I should be able to scroll to left
  When I scroll to left
  And I should see maximum 5 CTAs
  Then I should see "2 more CTAs" in "below SEO coopy" on "pspPage"
  And I should not see "HeroBanner" on "pspPage"
  And I should see only single line text below ad spot


@manual @DEBD-3936
Scenario: validate new Espot seo content on EPSP Pages redirecting to correct PSP when clicked
  Then I scroll to right
  When I click on "1stCTA"
  Then I should be redirected to the 1st CTA pspPage
  Then I should see "headerText" as "1stCTAtext" on "pspPage"
  And I should see "url" contains "/women/1stCTA"
  When I "validate & click" subMenu option "Tops" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Tops" on "pspPage"
  When I click on "2ndCTA"
  Then I should be redirected to the 1st CTA pspPage
  Then I should see "headerText" as "2ndCTAtext" on "pspPage"
  And I should see "url" contains "/women/2nsCTA"
  When I "validate & click" subMenu option "Tops" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Tops" on "pspPage"
  When I click on "3rdCTA"
  Then I should be redirected to the 3rdCTAtext pspPage
  Then I should see "headerText" as "3rdCTAtext" on "pspPage"
  And I should see "url" contains "/women/3rdCTA"
  When I scroll to left
  When I "validate & click" subMenu option "Tops" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Tops" on "pspPage"
  When I click on "4thCTA"
  Then I should be redirected to the 4thCTA pspPage
  Then I should see "headerText" as "4thCTAtext" on "pspPage"
  And I should see "url" contains "/women/4thCTA"
  When I "validate & click" subMenu option "Tops" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Tops" on "pspPage"
  When I click on "5thCTA"
  Then I should be redirected to the 5thCTA pspPage
  Then I should see "headerText" as "5thCTA" on "pspPage"
  And I should see "url" contains "/women/5thCTA"
