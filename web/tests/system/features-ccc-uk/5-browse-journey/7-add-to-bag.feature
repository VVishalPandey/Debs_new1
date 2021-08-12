Feature: Test Debenhams pdp page validation for beauty pages

@automated @DEBD-263
Scenario: Login to CCC site
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-556 @DEBD-114 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "testDressPdpURL"
  And I click on "addToBagButton" on "pdpPage"
  Then I should see "nothingSelectedErrorMessage" as "Please select an option" on "pdpPage"
  And I select available size enter quantity as "2" and add to bag on pdpPage
  And I validate add to bag message as per quantity "2" selector on "pdpPage"
  And I should not see "addedToBagNotification" on "minibagPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@automated @PDP @Fixed @DEBD-114 @DEBD-113 @DEBD-556 @DEBD-215
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "pdpBeautyColorProduct"
  And I select available size and add to bag on pdpPage
  And I validate add to bag message as per quantity "1" selector on "pdpPage"
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I go back to previous page
  And I validate current pdp product "exist" on "myBagPage"

@automated @PDP @Fixed @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Then I should see "searchIcon" exist on "commonPage"
  When I click on "searchIcon" on "commonPage"
  And I enter "<Products>" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"
  And I should not see "sizeSwatches" on "pdpPage"
  And I should see "sizeAsDropdown" exist on "pdpPage"
  Then I select available size and add to bag on pdpPage


  Examples:
  | Products    |
  |Phase Eight |
  |Dorothy Perkins |
  |Quiz |
  |Knickers |
  |Nightwear |
  |Jeans |
  |Shoes |

