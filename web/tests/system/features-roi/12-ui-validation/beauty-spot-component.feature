Feature: Test Debenhams new Beauty Spot component  on home Page

@manual @DEBD-3992
Scenario: validate new Beauty spots component  on home Page
  Given I am on "homePage"
  When I scroll past the first banner after hero component on "home Page"
  Then I should see "Beauty spots component" exists on "home Page"
  And I should see one row of Beauty spots
  And I should see 3 Beauty spots spots in total
  And I should see that the beauty offers are aligned vertically
  And I should see center aligned copy below each beauty spots
  And I validate that the copy can have links
  And I should see maxium 4 and minimum 1 line text below each spots
  And on clicking each spots it should redirect to respective PSP's
