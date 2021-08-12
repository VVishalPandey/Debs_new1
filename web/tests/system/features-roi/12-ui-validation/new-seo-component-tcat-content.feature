Feature: Test newly designed the seo component on TCAT/sale/content pages

@manual @DEBD-4208
Scenario: validate the seo component on TCAT/sale/contentPage below title
  Given I navigate to "TCAT/sale/contentPage"
  Then I should see a closed accordian along with page title
  When I click on the arrow
  Then I should see "NewseoComponent" on "TCAT/sale/contentPage" below title
  And I should see "NewseoComponent" is center alligned
  And I should be able to click on links's(if available ) on "NewseoComponent"
  And I should see "NewseoComponent" with links and without links
  And I should see  "NewseoComponent" is having maximum 6 lines of text
  When I click on the arrow again
  Then I should not see the "NewseoComponent" on "TCAT/sale/contentPage"

@manual @DEBD-4208
Scenario: validate arrow is visible only for Mobile not for Tablet/Desktop and copy in Desktop/Tablet should always be visible


@manual @DEBD-4208
Scenario: validate that the newly designed seo component on TCAT/sale/content pages is responsive for Desktop/Mobile/Tablet
