Feature: Test Debenhams ops test script journey number 25

@automated @opsTC
Scenario:Validate Grid bundles for luggage on the PDP page as per opsTC-25
  Given I logout
  Then I navigate to "LuggageGridBundleProductURL"
  And I validate all the details for grid bundle product "1" and add to bag
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  And I validate all the details for grid bundle product "2" and add to bag
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
  And I validate all the details for grid bundle product "3" and add to bag
  Then I click on "miniBagButton" on "pdpPage"
  And I should "remove" product "1" from minibag page
  And I click on "closeButton" on "minibagPage"
