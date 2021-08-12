Feature: Test Debenhams alternative header variants for My Bag page

@automated @DEBD-4050
Scenario: Validate that the header and footer is displayed when the mvt is not set
  Given I logout
  And I should see "createAccountLink" exist on "commonPage"
  Then I am on my details page
  And I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should see "globalNavMenuOptions" exist on "commonPage"
  And I should not see "myBagDisabled" on "myBagPage"

@automated @DEBD-4050
Scenario: Validate that the header and footer is displayed when the mvt is set but with the empty bag
  Given I logout
  And I set mvt test for "myBagHeader" as "variation1"
  And I click on "myBagButton" on "commonPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should see "globalNavMenuOptions" exist on "commonPage"
  And I should not see "myBagDisabled" on "myBagPage"


@automated @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 1 and product is added for guest user
  Given I navigate to "testDressPdpURL"
  And I set mvt test for "myBagHeader" as "variation1"
  Then I add the product to bag and go to my bag page
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@automated @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 1 when the product is removed from my bag
  And I "Remove" "all" products from "myBagPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty." on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"
  When I click on "logoDebenhams" on "commonPage"
  And I should not see "myBagDisabled" on "myBagPage"
  When I click on "myBagButton" on "myBagPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@notAutomated @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 1 and product is added for signedin user
  Given I'm on my details page
  Given I navigate to "testDressPdpURL"
  And I set mvt test for "myBagHeader" as "variation1"
  Then I add the product to bag and go to my bag page
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"
  Then I should see "DeliveryBanner" exist on "commonPage"

@notAutomated @DEBD-4050
Scenario: Validate that reduced header is displayed when the mvt is  set to 1 when the product is moved to saved items from my bag
  And I "Remove" "all" products from "mySavedItems"
  Then I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should see  "mysaveditem" as it is on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@notAutomated @DEBD-4050
Scenario: Validate that reduced header is displayed when the mvt is  set to 1 when the product is moved to my bag from saved items on my bag
  When I move items to "myBag"  from "Mysaveditems"on "myBagPage"
  Then I should see items added to my bag
  And I should see My bag count is updated on "mybagPage"
  And I increase the item count on "myBagPage"
  Then I should see My bag count is updated on "mybagPage"
  And I should see  "mysaveditem" as it is on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"
  And I enter "Hats" in "searchField" on "commonPage"
  Then I select the auto search department as "Women"
  Then I should see "headerText" as ""hats"" on "pspPage"
  And I should see "url" contains "search/hats/women"

@notAutomated @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 2 and product is added for guest user
  Given I navigate to "testDressPdpURL"
  And I set mvt test for "myBagHeader" as "variation2"
  Then I add the product to bag and go to my bag page
  Then I should see "logoDebenhamsCheckout" exist on "myBagPage"
  And I should see "progressBar" exist on "myBagPage"
  Then I should see "currentSelection" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton" on "commonPage"
  And I should not see "personalFinanceLink" on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink" on "commonPage"
And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"
  And i should not see "myBagButton" on "commonPage"
  And I click on "checkoutButton" on "myBagPage"
  When I click on "myBagButton" on "progressBar" on "myBagPage"
  Then I should see "progressbar" exist on "commonPage"
  And I should see "myBag" selected on "progressbar" on "myBagPage"
  And I should see "secureCheckoutButton" exists on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton"  on "commonPage"
  And I should not see "personalFinanceLink"  on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink"  on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"
  And i should not see "myBagButton" on "commonPage"

@notAutomated @DEBD-4050
Scenario: Validate that the  reduced header is displayed when the mvt is  set to 2 when the product is removed from my bag
  When I "removeAll" products from "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "progressbar" exist on "commonPage"
  And I should see "myBag" selected on "progressbar" on "myBagPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should not see "secureCheckoutButton" on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton"  on "commonPage"
  And I should not see "personalFinanceLink"  on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink"  on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"
  When I click on "DebenhamsLogo" on "myBagPage"
  When I click on "myBagButton" on "myBagPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should not see "secureCheckoutButton" on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton"  on "commonPage"
  And I should not see "personalFinanceLink"  on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink"  on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"

@notAutomated @DEBD-4050
Scenario: Validate that the  reduced header/footer is displayed when the mvt is  set to 2 and product is added for signedin user
  Given I'm on my details page
  And I navigate to "testDressPdpURL"
  Then I add the product to bag and go to my bag page
  And I set mvt test for "myBagHeader" as "variation2"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "progressbar" exist on "commonPage"
  And I should see "myBag" selected on "progressbar" on "myBagPage"
  And I should see "secureCheckoutButton" exists on "myBagPage"
  And I should not see "searchIcon" on "commonPage"
  And I should not see "savedItemsButton" on "commonPage"
  And I should not see "myBagButton"  on "commonPage"
  And I should not see "personalFinanceLink"  on "commonPage"
  And I should not see "storeFinderLink" on "commonPage"
  And I should not see "createAccountLink"  on "commonPage"
  And I should not see "myBeautyClubLink" on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  Then I should see "verifiedByVisaIcon" exist on "commonPage"
  Then I should not see "footerMenuList" on "commonPage"
  Then I should not see "footerSubMenuList" on "commonPage"
  Then I should not see "socialMediaSection" on "commonPage"

@notAutomated @DEBD-4050
Scenario: Validate that reduced header is displayed when the mvt is  set to 2 when the product is moved to saved items from my bag
  When I move all items to "Save for later"  from "myBagPage"
  Then I should see "emptyBagMessage" as "Your bag is currently empty" on "myBagPage"
  And I should see  "mysaveditem" as it is on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@notAutomated @DEBD-4050
Scenario: Validate that reduced header is displayed when the mvt is  set to 2 when the product is moved to my bag from saved items on my bag
  When I move items to "myBag"  from "Mysaveditems"on "myBagPage"
  Then I should see items added to my bag
  And I should see My bag count is updated on "mybagPage"
  And I increase the item count on "myBagPage"
  Then I should see My bag count is updated on "mybagPage"
  And I should see  "mysaveditem" as it is on "myBagPage"
  Then I should see "logoDebenhams" exist on "commonPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "personalFinanceLink" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "createAccountLink" exist on "commonPage"
  And I should see "myBeautyClubLink" exist on "commonPage"
  And I should see "footerMenuSection" exist on "commonPage"
  And I should not see "globalNavMenuOptions" on "commonPage"
  And I should see "myBagDisabled" exist on "myBagPage"

@manual @DEBD-4050
Scenario: Validate the delivery banner and "away from FREE Standard delivery" notifications on myBagPage is not regressed for both the variants

@manual @DEBD-4050
Scenario: Validate the promocoupons/discount functionality on myBagPage should work as it is for both the variants

@manual @DEBD-4050
Scenario: Validate the guest/ghost/registered checkout journey after my bag variant should work as it is

@manual @DEBD-4050
Scenario: Validate the variation should not work for Tablet/Mobile and ROI and the journey should be as it is currently

@manual @DEBD-4050
Scenario: Validate the finance banner points calculation as the finance banner has been removed.

@manual @DEBD-4050
Scenario: Validate the browserback button is working fine when the variant is enabled or disabled it should work as it is.
