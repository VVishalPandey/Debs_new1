Feature: Test Debenhams my saved item page in my account

@automated @DEBD-188
Scenario Outline: Validate that the change country behavior for My Saved Items
  Given I logout
  And I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I click on "savedItemsButton" on "commonPage"
  And I click on "removeAllProductsButton" on "mySavedItemPage"
  And I click on "yesRemoveAllButtonOnPopUp" on "mySavedItemPage"
  When I navigate to "testDressPdpURL"
  Then I store name of product and select save item on pdpPage
  When I navigate to "pdpBeautyColorProduct"
  Then I store name of product and select save item on pdpPage
  When I navigate to "testFurnitureSingleSKUURL"
  Then I store name of product and select save item on pdpPage
  And I click on "savedItemsButton" on "commonPage"
  And I validate products are saved on mySavedItemPage
  And I should see "firstProductChooseOptionButton" "enabled" on "mySavedItemPage"
  And I should see "secondProductChooseOptionButton" "enabled" on "mySavedItemPage"
  And I should see "thirdProductChooseOptionButton" "enabled" on "mySavedItemPage"
  When I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I click on "savedItemsButton" on "commonPage"
  And I validate products are saved on mySavedItemPage
  And I should see "firstProductChooseOptionButton" "disabled" on "mySavedItemPage"
  And I should see "secondProductChooseOptionButton" "disabled" on "mySavedItemPage"
  And I should see "thirdProductChooseOptionButton" "enabled" on "mySavedItemPage"
  And I should see "firstProductOOSMessage" exist on "mySavedItemPage"
  And I should see "secondProductOOSMessage" exist on "mySavedItemPage"
  And I should not see "thirdProductOOSMessage" on "mySavedItemPage"
  When I "validate & click" country as "United Kingdom" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I click on "savedItemsButton" on "commonPage"
  And I validate products are saved on mySavedItemPage
  And I should see "firstProductChooseOptionButton" "enabled" on "mySavedItemPage"
  And I should see "secondProductChooseOptionButton" "enabled" on "mySavedItemPage"
  And I should see "thirdProductChooseOptionButton" "enabled" on "mySavedItemPage"

Examples:
   | email                             | password   |
   | testsaveditemsautomation@test.com | Sapient123 |
