
Feature: Test Debenhams homepage feature for international

@manual @DDAI-254
Scenario:Validate New Debenhams Ireland logo header on different pages for ROI
  Given I am on the Debenhams Ireland site
  When I navigate to the homepage, TCAT, PSP, PDP, Shopping Bag
  Then I should see the Debenhams Ireland logo visible on every single page
  Given I am on the Payment page
  Then I should see the Debenhams Ireland payment logo with a padlock as the header
  Given I have selected the header logo on any pages on Debenhams.ie
  Then I should be directed to the homepage (http://www.debenhams.ie)
