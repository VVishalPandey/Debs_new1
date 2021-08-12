Feature: Test Debenhams new carousel component  on TCATs / EPSPS / content pages

@manual @DEBD-4341
Scenario: validate new carousel component  on TCATs/EPSPS/content pages
  Given I am on "TCATs/EPSPS/content pages"
  When I scroll past the hero component on "TCATs/EPSPS/content pages"
  Then I should see "new carousel component" exists on "TCATs/EPSPS/content pages"
  And I should see 2 rows spots  in new carousel component
  And each carousel should have maximum 3 scrolling spots
  And I should not see arrows on the carousel
  And I should see maximum 6 spots in total
  And I should see 1 exposed spot and one teaser on the right
  And I should see some part of the next spot(teaser) at the end
  And I should be able to swipe right with scrolling carousel
  And I should see scrolling bar appear below the carousel while scrolling
  And Scrolling bar should disappear when scrolling stops
  And I should see maxium 3 and minimum 1 line text below each offer

@manual @DEBD-4341
Scenario:  validate new carousel component  on TCATs/EPSPS/content pages with 3/6 spots

@manual @DEBD-4341
Scenario:  validate the carousel doesn't regress other components on the page

@manual @DEBD-4341
Scenario:  validate we should not see the carousel on Desktop/Tablet, instead we should see 6 exposed spots in 2 rows

@manual @DEBD-4341
Scenario:  validate the spots on the content page with or without LHN

@manual @DEBD-4341
Scenario:  validate the spots and the links below the spots are cliackable for desktop/Tablet/Mobile





