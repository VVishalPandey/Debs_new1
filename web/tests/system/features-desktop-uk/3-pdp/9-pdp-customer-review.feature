
Feature: Validate PDP review section

@notAutomated @DBMTE-55 @awsManual
Scenario: Validate the review section on the dresses pdp page
  Then I should see "ratingSummaryInHeader" exist on "pdpPage"
  And I should see "reviewSection" exist on "pdpPage"
  When I am in view of "reviewHeaderText" on "pdpPage"
  Then I should see "reviewHeaderText" as "Reviews" on "pdpPage"
  And I should see "reviewSorting" exist on "pdpPage"
  And I should see "reviewWrite" exist on "pdpPage"

@manual @DBMTE-56 @Issue95 @awsManual
Scenario: Navigate to dress pdp page with no reviews and validate the review section
  When I navigate to "testDressPdpNoReview"
  Then I validate the review section with no reviews
