Feature: Test Debenhams new Espot seo content on EPSP Pages

@manual @DEBD-3907
Scenario: validate new Espot seo content on EPSP Pages
  Given I logout
  When I "validate & click" subMenu option "Dress" under "Women" on commonPage bigscreen
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should see "url" contains "/women/dresses#intcmp-topnav-womenddn-heading-Clothing-link-Dresses"
  And I should see "seocopy" exist on "pspPage"
  And I should see "NewEpspConent" exist on "pspPage"
  And I should see "3 images" in "adspot" on "pspPage"
  And I should be able to scroll to left
  When I scroll to left
  Then I should see "2 more images" in "adspot" on "pspPage"
  And I should not see "HeroBanner" on "pspPage"
  And I should see only single line text below ad spot


@manual @DEBD-3907
Scenario: validate new Espot seo content on EPSP Pages redirecting to correct PSP when clicked
  Then I scroll to right
  When I click on "1stAdspot"
  Then I should be redirected to the 1st adspot pspPage
  Then I should see "headerText" as "1stAdspottext" on "pspPage"
  And I should see "url" contains "/women/1stAdspot"
  Then I go back to previous page
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "2ndAdspot"
  Then I should be redirected to the 1st adspot pspPage
  Then I should see "headerText" as "2ndAdspottext" on "pspPage"
  And I should see "url" contains "/women/2nsAdspot"
  Then I go back to previous page
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "3rdAdspot"
  Then I should be redirected to the 3rdAdspottext pspPage
  Then I should see "headerText" as "3rdAdspottext" on "pspPage"
  And I should see "url" contains "/women/3rdAdspot"
  Then I go back to previous page
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "4thAdspot"
  Then I should be redirected to the 4thAdspot pspPage
  Then I should see "headerText" as "4thAdspottext" on "pspPage"
  And I should see "url" contains "/women/4thAdspot"
  Then I go back to previous page
  Then I should see "headerText" as "Dresses" on "pspPage"
  When I click on "5thAdspot"
  Then I should be redirected to the 5thAdspot pspPage
  Then I should see "headerText" as "5thAdspot" on "pspPage"
  And I should see "url" contains "/women/5thAdspot"
  Then I go back to previous page
  Then I should see "headerText" as "Dresses" on "pspPage"

