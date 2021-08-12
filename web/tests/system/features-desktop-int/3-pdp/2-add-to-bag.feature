Feature: Test Debenhams pdp page validation for beauty pages

@automated @DEBD-114 @dataNA
Scenario: Navigate to dress and validate circular size swatch
  Given I navigate to "homeURL"
  When I "validate & click" country as "New Zealand" from "countryOptions" on "commonPage"
  When I navigate to "productWithNumberSizeSwatch"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "2 items added to bag" on "pdpPage"
  And I should not see "addedToBagNotification" on "minibagPage"

@automated @PDP @Fixed @DEBD-114 @Issue1719
Scenario: Navigate to dress and validate circular size swatch
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "productWithAlphabetSizeSwatch"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  And I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "2 items added to bag" on "pdpPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-113 @Issue1719
Scenario: Navigate to dress and validate circular size swatch
  Given I navigate to "homeURL"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  When I navigate to "productWithRangeSizeDropdown"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "2 items added to bag" on "pdpPage"

@notautomated @DEBD-114
Scenario: Validation of add to bag of the recently viewed item
  When I am in view of "recentlyViewed" on "pdpPage"
  Then I should match product name of first product "recentlyViewedProduct1" in carousel on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  Then I should see "viewBasketCheckoutButton" exist on "pdpPage"
  And I should see "addToBagRemainingText" as "2 items added to bag" on "pdpPage"

@notAutomated @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
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
  |Phase Eight |
  |Coast |
  |Dorothy Perkins |
  |Quiz |
  |Wallis |
  |Debut |
  |Jenny Packham |
  |Mantaray |
  |RedHerring |
  |The Collection |
  |Star by Julien Macdonald |
  |Dress Studio by Preen |
  |Nine by Savannah Miller |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |
