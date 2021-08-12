Feature: Test Debenhams new Top Offers component  on home Page with different varient

@manual @DEBD-3871
Scenario: validate new Top Offers component  on home Page varient1
  Given I am on "homePage"
  When I scroll past the hero component on "home Page"
  Then I should see "TOP OFFERS component" exists on "home Page"
  And I should see one row of Top Offers carousel
  And the carousel should have 4 scrolling Offers spots
  And I should see arrows on each side of the carousel
  And I should see 6 top offers spots in total
  Then on clicking the arrows, carausel should scroll accoridingly.
  And I should see maxium 3 and minimum 1 line text below each offer
  And I should see dots below the carousel

@manual @DEBD-3871
Scenario: validate new Top Offers component  on home Page varient2
  Given I am on "homePage"
  When I scroll past the hero component on "home Page"
  Then I should see "TOP OFFERS component" exists on "home Page"
  And I should see tow rows of Top Offers component
  And each row should have 3 Offers
  And I should see maxium 3 and minimum 1 line text below each offer
  And I should see 6 top offers spots in total
  And on clicking each offer it should redirect to respective PSP's


@manual @DEBD-3871
Scenario: validate new Top Offers component  on home Page varient3A
  Given I am on "homePage"
  When I scroll past the hero component on "home Page"
  Then I should see "TOP OFFERS component" exists on "home Page"
  And I should see one row of Top Offers carousel
  And the carousel should have 4 scrolling Offers spots
  And I should see some part of the next offer spot(teaser) at the end of the caraousel
  And I should see 6 top offers spots in total
  And I should see maxium 3 and minimum 1 line text below each offer
  And on clicking each offer it should redirect to respective PSP's


@manual @DEBD-3871
Scenario: validate new Top Offers component  on home Page varient3B
  Given I am on "homePage"
  When I scroll past the hero component on "home Page"
  Then I should see "TOP OFFERS component" exists on "home Page"
  And I should see one row of Top Offers carousel
  And the carousel should have 4 scrolling Offers spots
  And I should see some part of the next offer spot(teaser) at the end of the caraousel
  And I should see 6 top offers spots in total
  And I should see some part of the next offer spot(teaser) at the start of the caraousel
  And I should see maxium 3 and minimum 1 line text below each offer
  And on clicking each offer it should redirect to respective PSP's




