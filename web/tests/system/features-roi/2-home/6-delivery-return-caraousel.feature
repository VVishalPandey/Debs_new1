Feature: Test Debenhams add Value proposition bar to mobile	home page

@DEBD-3964 @manual
Scenario: Validate add Value proposition bar on home page with Variant 1
  Given I navigate to "homePageURL"
  When I set mvt test for "valuePropositionBanner" as "variation1"
  Then I should see "deliveryReturnCarousel" below heroBanner on "homePage"
  And I should see "deliveryReturnCarousel" is set to autoscrolling
  And I should be able to scroll the carousel manually
  And I should see 3 pips in below the caraousel
  And I should see Arrow on the both side of the caraousel
  And I should see 3 options in the carousel
  And I should see "1st option " as "Free standarad delivery"  on "homePage"
  And I should see "Free standard delivery" option should contain text " on orders €30 or over"
  And I should see "Free standard delivery icon" on first option
  Then I scroll to "2nd Option"
  And I should see "2nd option " as "Next Day delivery"  on "homePage"
  And I should see "Next Day delivery" option should contain text "Find Out more"
  And I should see "Next Day delivery icon" on first option
  Then I scroll to "3rd Option"
  And I should see "3rd Option " as "Free Retuns"  on "homePage"
  And I should see "Free Retuns" option should contain text "In Store or via Hermes"
  And I should see "Free Retuns icon" on first option
  When I click on "Free standard delivery"  on "homePage"
  Then I should be redirected to "Free Standard delivery FAQ page"
  When I click on "Next Day delivery"  on "homePage"
  Then I should be redirected to "Next Day delivery FAQ page"
  When I click on "Free returns"  on "homePage"
  Then I should be redirected to "returns and refund FAQ page"



@DEBD-3964 @manual
Scenario: Validated add Value proposition bar on home page with Variant 3
  Given I navigate to "homePageURL"
  When I set mvt test for "valuePropositionBanner" as "variation3"
  Then I should see "deliveryReturnbanner" above heroBanner on "homePage"
  And I should see "deliveryReturnbanner" is set to autoscrolling
  And I should be able to scroll the the banner manually
  And I should see 3 options in the banner
  And I should see "1st option " as "Free standarad delivery"  on "homePage"
  And I should see "Free standard delivery" option should contain text " on orders €30 or over"
  And I should see "Free standard delivery icon" on first option
  Then I scroll to "2nd Option"
  And I should see "2nd option " as "Next Day delivery"  on "homePage"
  And I should see "Next Day delivery" option should contain text "Find Out more"
  And I should see "Next Day delivery icon" on first option
  Then I scroll to "3rd Option"
  And I should see "3rd Option " as "Free Retuns"  on "homePage"
  And I should see "Free Retuns" option should contain text "In Store or via Hermes"
  And I should see "Free Retuns icon" on first option
  When I click on "Free standard delivery"  on "homePage"
  Then I should be redirected to "Free Standard delivery FAQ page"
  When I click on "Next Day delivery"  on "homePage"
  Then I should be redirected to "Next Day delivery FAQ page"
  When I click on "Free returns"  on "homePage"
  Then I should be redirected to "returns and refund FAQ page"


@DEBD-3964 @manual
Scenario: Validated add Value proposition bar on home page with Variant 3
  Given I navigate to "dressPSPPage"
  When I set mvt test for "valuePropositionBanner" as "variation3"
  Then I should see "deliveryReturnbanner" above heroBanner on "homePage"
  And I should see "deliveryReturnbanner" is set to autoscrolling
  And I should be able to scroll the the banner manually
  And I should see 3 options in the banner
  And I should see "1st option " as "Free standarad delivery"  on "homePage"
  And I should see "Free standard delivery" option should contain text " on orders €30 or over"
  And I should see "Free standard delivery icon" on first option
  Then I scroll to "2nd Option"
  And I should see "2nd option " as "Next Day delivery"  on "homePage"
  And I should see "Next Day delivery" option should contain text "Find Out more"
  And I should see "Next Day delivery icon" on first option
  Then I scroll to "3rd Option"
  And I should see "3rd Option " as "Free Retuns"  on "homePage"
  And I should see "Free Retuns" option should contain text "In Store or via Hermes"
  And I should see "Free Retuns icon" on first option
  When I click on "Free standard delivery"  on "homePage"
  Then I should be redirected to "Free Standard delivery FAQ page"
  When I click on "Next Day delivery"  on "homePage"
  Then I should be redirected to "Next Day delivery FAQ page"
  When I click on "Free returns"  on "homePage"
  Then I should be redirected to "returns and refund FAQ page"

@DEBD-3964 @manual
Scenario: Validate add Value proposition bar should not appear on home page for Tablet and Desktop with Variant 3


@DEBD-3964 @manual
Scenario: Validate add Value proposition bar should not appear on home page for Tablet and Desktop with Variant 3




