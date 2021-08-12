Feature: Test Debenhams ops test script journey number 12

@automated @opsTC
Scenario: Navigate to chanel perfume PDP page and validate the quantity selector is disabled when quantity set to 3 (max quantity)
  Given I logout
  When I navigate to "testChanelPerfPdpURL"
  And I enter "4" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"

@automated @opsTC
Scenario: Add quantity 2 and add to bag and store details from my bag
  And I enter "2" in "stepperCount" on "pdpPage"
  Then I add to bag quantity "2" and go to my bag page
  And I store details from myBag to validate later
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
