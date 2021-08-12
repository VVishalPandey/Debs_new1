Feature: Test Debenhams add to bag functionality on pdp pages

@automated  @Fixed @DBNHST-379 @DBNHST-378
Scenario: Navigate to dress pdp page and add to bag, also validate if product appears in my bag
  Given I navigate to "testDressPdpURL"
  And I add the product to bag and go to my bag page
  And I wait for "3000" milliseconds
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"
  Then I should see "testDressProductName" product name exist on myBagPage

@automated  @Fixed @DBNHST-379
Scenario: Navigate to perfume pdp page and add to bag, also validate if product appears in my bag with free gift
  Given I navigate to "testPerfumePdpURL"
  Then I should see "addToBagButton" exist on "pdpPage"
  And I should validate minibag count "before"
  And I select available size from "dropdown"
  And I change the stepper count to "3"
  When I click on "addToBagButton" on "pdpPage"
  And I wait for "3000" milliseconds
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "ITEM ADDED TO BAG" on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 4"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "testPerfumeProductName" product name exist on myBagPage
  And I should see "testPerfumeFreeProductName" product name exist on myBagPage

@manual @DBNHST-379
Scenario: Navigate to dress pdp page and validate the error when selected add to bag without selecting any size
  Given I navigate to "testDressPdpURL"
  When I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"

@automated  @Fixed @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  And I enter "<Products>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "sizeSwatches" on "pdpPage"
  And I should see "sizeDropdownOptionElements" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage


  Examples:
  | Products    |
  |Jeff Banks |
  |Dorothy Perkins |
  |Wallis |
  |Debut |
  |Jenny Packham |
  |Principles |
  |RedHerring |
  |The Collection |
  |Star by Julien Macdonald |
  |Dress Studio by Preen |
  |Nine by Savannah Miller |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |
