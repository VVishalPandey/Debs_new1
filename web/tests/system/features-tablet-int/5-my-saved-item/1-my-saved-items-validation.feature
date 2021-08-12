Feature: Test Debenhams my saved items

@automated @DBMTE-42
Scenario: Navigate to Debenhams saved items page and validate the products saved for later are displayed in my saved items page
  #Given I am on my details page
  Then I click on "menuIcon" on "commonPage"
  When I click on "MyAccountInt" on "commonPage"  
  Then I click on "menuIcon" on "commonPage"  
  Then I should see value of position "1" as "Women"
  When I click on "Women" position "1"
  Then I should see value of position "3" as "Dresses"
  When I click on "Dresses" position "3"
  Then I should see value of position "3" as "All dresses"
  When I click on "All dresses" position "3"
  And I wait for "2000" milliseconds
  When I store value of first "2" products and select save item on pspPage
  When I click on "menuIcon" on "commonPage"
  Then I should see nav menu back option as "Dresses"
  When I click on nav menu back option as "Dresses"
  Then I should see nav menu back option as "Women"
  When I click on nav menu back option as "Women"
  And I should see value of position "12" as "Saved Items"
  When I click on "Saved Items" position "12"
  And I wait for "6000" milliseconds
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  Then I validate products are saved on mySavedItemPage

@automated @DBMTE-42
Scenario: Navigate to Debenhams my saved items page for AUS and validate that all the saved products for UK are displayed in my saved item page for AUS
  When I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "goButton" on "commonPage"
  And I wait for "3000" milliseconds
  Then I should see "countrySelectedFooter" as "Australia" on "commonPage"
  When I click on "menuIcon" on "commonPage"
  #Then I click on "My Account" position "11"
  Then I click on "Saved Items" position "12"
  And I wait for "6000" milliseconds
  Then I validate products are saved on mySavedItemPage

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page and validate the name and price of new added foundation product
  When I navigate to "womenDressesPspUrl"
  Then I should see "headerText" as "Dresses" on "pspPage"
  And I should validate product name on "pspPage"
  And I should validate final price on "pspPage"
  When I click on "firstProductImage" on "pspPage"
  Then I should validate product name on "pdpPage"
  And I should validate final price on "pdpPage"
  And I validate all sizes on "pdpPage"
  Then I validate size on my bag page from "pdpPage"
  When I select save for later for above product on "myBagPage"
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should validate product name on "mySavedItemPage"
  And I should validate final price on "mySavedItemPage"
  And I should validate dress size on "mySavedItemPage"
  And I validate the "total items"

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page and validate product added when add to bag from saved items page
  When I add to bag above product
  And I navigate to "basketCheckoutUrl"
  Then I should validate product name on "myBagPage"

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page when user log out
  Given I logout
  When I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "tab1" as "Sign In" on "mySavedItemPage"
  And I should see "tab2" as "Create an account" on "mySavedItemPage"

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page and validate remove all pop up and also validate when no is selected
  Given I logout
  When I am on my details page
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  When I click on "removeAllLink" on "pspPage"
  Then I should see "removePopUpHeaderText" as "Remove all" on "mySavedItemPage"
  And I should see "removePopUpCloseIcon" exist on "mySavedItemPage"
  And I should see "removePopUpNoButton" exist on "mySavedItemPage"
  And I should see "removePopUpNYesButton" exist on "mySavedItemPage"
  When I click on "removePopUpNoButton" on "pspPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "removeAllLink" exist on "mySavedItemPage"

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page and validate products removed when select remove all
  When I click on "removeAllLink" on "pspPage"
  Then I should see "removePopUpHeaderText" as "Remove all" on "mySavedItemPage"
  When I click on "removePopUpNYesButton" on "pspPage"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "paraText" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should not see "removeAllLink" on "mySavedItemPage"

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page having saved items and validate removing a product is working fine

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page having saved items and add to bag is working fine for bundle product

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page and validate user able to add to bag for single sku product

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page and validate user able to add to bag for product with options to choose

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page and validate user not able to add to bag for product with if options to choose is not selected for multiSKU product

@manual @DBMTE-42
Scenario: Navigate to Debenhams my saved items page and validate breadcrumb, header text and image ,product image links , product description PDP link

@manual @DBMTE-42
Scenario: Navigate to a PSP page and validate that user is able to save a product for later by clicking on the save for later image on the PSP

@manual @DBMTE-42
Scenario: Navigate to a PDP page and validate that user is able to save a product for later by clicking on the save for later image on the PDP

@manual @DBMTE-42
Scenario: Navigate to a My bag page and validate that user is able to save a product for later by clicking on the save for later image on the My bag page

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page having saved items and validate if the user select no in the remove product pop up the product is not removed from my saved item

@manual @DBMTE-42 @DBMTE-147
Scenario: Navigate to Debenhams my saved items page having saved items and validate remove all link functionality on my saved items page

@manual @DBMTE-336
Scenario: Navigate to Debenhams UK site dress PSP page and save for later a product which is avaliable in both UK and AUS and validate that on changing the country from UK to AUS a message is displayed on the country selector pop up

@manual @DBMTE-336
Scenario: Navigate to Debenhams UK site dress PSP page and save for later a product which is avaliable in both UK and AUS and validate that the product saved for later for UK is also displayed in my saved items for AUS

@manual @DBMTE-336
Scenario: Navigate to Debenhams UK site dress PDP page and save for later a product which is avaliable in both UK and AUS and validate that the product saved for later for UK is also displayed in my saved items for AUS

@manual @DBMTE-336
Scenario: Navigate to Debenhams UK site dress my bag page and save for later a product which is avaliable in both UK and AUS and validate that the product saved for later for UK is also displayed in my saved items for AUS


@manual @DDAI-1005
Scenario: Validate notification displays to confirm item has been added to bag from SFL. Notification should be visible for 3 seconds before dispearing 
  Given I am on SFL with some items in it
  Then I add some items to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display

@manual @DDAI-1005  
Scenario: Validate notification should be visible for 3 seconds before dispearing 
  Given I am on SFL with some items in it
  Then I add some items to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display
  Then I should see the notification visible for 3 seconds before dispearing
  And After 3 seconds it should get disapear

@manual @DDAI-1005  
Scenario: Validate notification should be visible for 3 seconds before dispearing and disapear if user navigates to some other page before 3 seconds
  Given I am on SFL with some items in it
  Then I add some items to bag from SFL
  Then I should see notification " Your Item is added to the bag" should display
  Then I move to some other page
  And  Notification should get disappear
