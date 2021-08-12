Feature: Test Debenhams  New responsive carousel component on TCATs/content pages/EPSP

@manual @DEBD-4110
Scenario Outline: validate  New responsive carousel component  on Tcat Pages
  Given I am on "<Pages>"
  When I scroll down the page on "<Pages>"
  Then I should see "New responsive carousel component" exists on "WomenTcat"
  And I should see one row of "New responsive carousel"
  And the carousel should have 5 scrolling  spots
  And I should see 5 "New responsive carousel spots" in total
  And I should see some part of the next carousel spot(teaser) at the end of the caraousel
  And I should see not see arrows on  top  of the teaser
  Then on swiping to left and right  carousel should scroll accoridingly.
  When we move to next spot after swiping
  Then we should see teaser on both side of the spots
  And I should not see arrows on both teaser
  When I scroll to the last spots
  Then I should see the teaser at the left side of the spot
  And I should not see the left arrow on top of the teaser
  And I should see  0 line inside each spots below heading
  And I should see 5 scrolling dots below the carousel
  And each spots should be clickable

  Examples:
    |       Pages      |
    | womenTcat        |
    | contentPage      |
    | EpspPage         |

@manual @DEBD-4110
Scenario: validate  padding of new responsive component  on TCATs/content pages/EPSP pages

@manual @DEBD-4110
Scenario: validate New responsive carousel component  on TCATs/content pages/EPSP pages redirecting to correct brandroom when clicked
  When I click on "1stspot"
  Then I should be redirected to the 1st adspot brandPage
  Then I should see "headerText" as "1stspottext" on "pspPage"
  And I should see "url" contains "/1stSpot"
  And I navigate to previous page
  When I click on "2ndSpot"
  Then I should be redirected to the 2nd spot brandPage
  Then I should see "headerText" as "2ndSpottext" on "pspPage"
  And I should see "url" contains "/2ndSpot"
  And I navigate to previous page
  When I click on "3rdSpot"
  Then I should be redirected to the 3rdSpot brandPage
  Then I should see "headerText" as "3rdSpot" on "pspPage"
  And I should see "url" contains "/3rdSpot"
  And I navigate to previous page
  When I click on "4thSpot"
  Then I should be redirected to the 4thSpot brandPage
  Then I should see "headerText" as "4thSpot" on "pspPage"
  And I should see "url" contains "/4thSpot"
  And I navigate to previous page
  When I click on "5thSpot"
  Then I should be redirected to the 5thSpot brandPage
  Then I should see "headerText" as "5thSpot" on "pspPage"
  And I should see "url" contains "/5thSpot"

@manual @DEBD-4110
Scenario: validate the other components are not regressed  on TCATs/content pages/EPSP pages

@manual @DEBD-4110
Scenario: validate the other components are not regressed  when the caousel is set up at different postions (Top/Middle/Bottom)

@manual @DEBD-4110 @DEBD-4109
Scenario: validate new responsive caraousel component fits within the new width defined  on TCATs/content pages/EPSP pages

@manual @DEBD-4109
Scenario: Validate the width of the content page is fixed at 1024px and it should not exceed that and I should see full width component on the page.

@manual @DEBD-4109
Scenario: Validate the width of the content/Tcat pages is fixed at 1440px when LHN is on.

@manual @DEBD-4100
Scenario: Validate the filter accordion icon on content pages are changes to + when opened and - when closed

@manual @DEBD-4100
Scenario: Validate the filter accordion icon changes on content pages doesnot regress the filtering and  filter icons on other pages
