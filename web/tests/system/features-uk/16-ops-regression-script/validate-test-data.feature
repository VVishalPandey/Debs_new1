Feature: Verify if the test data is avalilable for the OPS scenarios

@globalNav @ops-TD @J-1
Scenario: Validate the GN
  Given I logout
  When I am on my details page
  And I "Remove" "all" products from "myBagPage"
  #Then I empty mini bag
  Then I empty mySavedItemPage
  Then I click on "menuIcon" on "commonPage"
  And I should see value of position "14" as "My Account"
  And I should see value of position "20" as "Sign out"
  Then I click on "closeIcon" on "commonPage"

@globalNav @ops-TD @J-2
Scenario: Validate the navigation urls
  Then I navigate to "mantarayProduct"
  Then I select available size from "swatch"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCloseButton" on "pdpPage"

@searchPage @ops-TD @J-3 @kidsDress @Mantaray
Scenario: Validate the search pages
  Given I logout
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsKidsDressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-3 @womenDress @Wallis
Scenario: Validate the search pages  
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsWomenDressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-3 @Handbags @JasperConran
Scenario: Validate the search pages
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsHandbagsTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@globalNav @ops-TD @J-3
Scenario: Validate the navigation urls
  Given I navigate to "chanelPerfumePdp"
  Then I should see "chanelSlimBanner" exist on "pdpPage"

@globalNav @ops-TD @J-3
Scenario: Validate the navigation urls
  Given I navigate to "chanelLipstickPdp"
  Then I should see "chanelSlimBanner" exist on "pdpPage"

@globalNav @ops-TD @J-3
Scenario: Validate the navigation urls
  Then I navigate to "concessionProduct"
  Then I select available size from "swatch"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCloseButton" on "pdpPage"

@searchPage @ops-TD @J-4 @Beauty-Multisku
Scenario: Validate the search pages
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautyMultiTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-4 @Beauty-dropdown
Scenario: Validate the search pages
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautyDropTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-4 @Beauty-singlesku
Scenario: Validate the search pages
  And I click on "searchIcon" on "commonPage"
  And I enter "OpsBeautySingleTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@globalNav @ops-TD @J-4
Scenario: Validate the navigation urls
  Then I navigate to "katVonDBeautyProduct"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCloseButton" on "pdpPage"

@searchPage @ops-TD @J-5 @furniture-Debenhams
Scenario: Validate the search pages
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureMultiTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-5 @furniture-Debenhams
Scenario: Validate the search pages
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureSingleTestText" in "searchField" on "commonPage"
  Then I enter "3260041265" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@searchPage @ops-TD @J-5 @furniture-Sleepeezee
Scenario: Validate the search pages
  When I click on "searchIcon" on "commonPage"
  Then I enter "OpsFurnitureMattressTestText" in "searchField" on "commonPage"
  And I click on "searchApply" on "commonPage"
  Then I should validate product name on "pspPage"

@globalNav @ops-TD @J-5
Scenario: Validate the navigation urls
  Then I navigate to "furnitureJouneyProduct"
  And I click on "addToBagButton" on "pdpPage"
  And I click on "viewBasketCloseButton" on "pdpPage"

@searchPage @ops-TD @J-6 @Womendress
Scenario: Validate the search pages
  Then I click on "searchIcon" on "commonPage"
  And I enter "OpsWomenDressSFLTestText" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"

@searchPage @ops-TD @J-6 @furnitureSingleSku
Scenario: Validate the search pages
  Then I click on "searchIcon" on "commonPage"
  And I enter "OpsFurnitureSingleSKUTestText" in "searchField" on "commonPage"
  When I click on "searchApply" on "commonPage"
  When I click on "firstProductImage" on "pspPage"




