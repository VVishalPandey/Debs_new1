Feature: Test Debenhams Dotie pdp page add to bag and beauty product validation

@manual @DBMTE-671
Scenario: Navigate to Beauty - Make Up page and validate colour swatches and drop down for product "Lipstick"
  Given I logout
  And I navigate to "testlipstickUrl"
  When I should see "beautyColourSwatches" exist on "pdpPage"
  And I should validate minibag count "before"
  And I should see selected colour as "A-Go-Go"
  And I select available colour "2" as "Ayesha" from "colourSwatch"
  And I should see selected colour as "Ayesha"
  Then I should see "colourDropDown" exist on "pdpPage"
  And I should see selected colour as "Ayesha"
  Then I select available colour "3" as "Bachelorette" from "colourDropDown"
  And I should see selected colour as "Bachelorette"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"

@manual @DBMTE-671
Scenario: Navigate to Chanel and validate max quantity and price per ml
  Given I navigate to "testChanelPerfPdpURL"
  And I should validate minibag count "before"
  And I enter "4" in "stepperCount" on "pdpPage"
  Then I should see "stepperIncrement" "disabled" on "pdpPage"
  When I enter "2" in "stepperCount" on "pdpPage"
  Then I add to bag quantity "2" and go to my bag page
  #And I store details from myBag to validate later
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 2"

@manual @DBMTE-671
Scenario: Navigate to beauty product with free gift badging
  Given I navigate to "freeGiftProductUrl"
  And I should validate minibag count "before"
  And I should see "giftBadgeLink" exist on "pdpPage"
  Then I click on "giftBadgeLink" on "pdpPage"
  #And I should see "freeGiftSection" exist on "pdpPage"
  When I am in view of "stepperCount" on "pdpPage"
  And I click on "addToBagButton" on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"

@manual @DBMTE-671
Scenario: Navigate to beauty product and validate beauty loyalty points
  When I navigate to "productUrl"
  When I am in view of "sizeDropDown" on "pdpPage"
  And I should see "pricePerml" exist on "pdpPage"
  And I should see "beautyClubValuePoints" containing "points with the Beauty Club Card" on "pdpPage"

@manual @DBMTE-671
Scenario: Navigate to beauty product and validate delivery options along with return details
  And I should validate minibag count "before"
  And I am in view of "deliveryAndReturnsOptions" on "pdpPage"
  And I should see "deliveryReturnDetails" exist on "pdpPage"
  And I should see "homeDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "cCDeliveryMoreInfoLink" exist on "pdpPage"
  And I should see "returnMessage" exist on "pdpPage"
  And I add to bag quantity "1" and go to my bag page
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"

@manual @DBMTE-671 
Scenario: Navigate to lingerie product as bra and validate buying guide and add to bag after selecting a size
  When I navigate to "braUrl"
  And I should validate minibag count "before"
  Then I verify page reload on selecting a different colour swatch
  And I am in view of "productDescriptionLink" on "pdpPage"
  And I click on "productDescriptionLink" on "pdpPage"
  And I am in view of "buyGuideEspot" on "pdpPage"
  Then I should see "buyGuideText" as "Read our buying guide" on "pdpPage"
  And I verify "href" of "buyGuideText" as "buyGuideLink" on "pdpPage"
  Then I am in view of "financeBanner" on "pdpPage"
  And I verify "href" of "applyNowButton" as "applyNowLink" on "pdpPage"
  Then I add to bag quantity "1" and go to my bag page
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"

@manual @DBMTE-671
Scenario: Navigate to dress and validate circular size swatch
  When I navigate to "productWithSizeSwatch"
  And I should validate minibag count "before"
  And I should validate minibag count "before"
  # And I select available size on "pdpPage"
  And I wait for "3000" milliseconds
  Then I select available size and add to bag on pdpPage
  # Then I click on "addToBagButton" on "pdpPage"
  And I should validate minibag count "after"
  And I should validate minibag count "diffence as 1"

@notAutomated @DEBD-2267
Scenario Outline: Validate that size dropdown is displayed on all PDP pages which have size selector
  Given I logout
  # Then I navigate to "<PDPurl>"
  Given I navigate to "homeURL"
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
