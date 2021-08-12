Feature: Test Debenhams my saved items for International Site

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page after login and validate the page when there is no item saved
  Given I logout
  When I am on my details page
  And I navigate to "mySavedItemPageUrl"
  Then I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I should see "itemsCountText" as "(0 items)" on "mySavedItemPage"
  And I should see "paraText" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should see "goShoppingButton" exist on "mySavedItemPage"
  When I click on "goShoppingButton" on "mySavedItemPage"
  Then I should not see "goShoppingButton" on "mySavedItemPage"

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page>Validate skeleton loading
  Given I am a guest or a registered user
  When I go to my saved items
  Then I should see skeleton loading whilst the page loads

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page>Validate functionality for guest user
  Given I am a guest user
  And I have not saved any items
  When I go to my saved items
  Then I see the no saved items messaging
  And the sign in/create account tabs
  Given I am a guest
  And I have previously saved at least 1 item
  When I am on my saved items page
  Then I will see the sign in warning message (see screenshot)
  And I will see this message whenever I return to my saved items until I sign in
  Given I am a guest
  And I have more than 1 saved item
  When I sign in
  Then any saved items will be saved to my signed in account
  Given I am a guest or have had no prior session
  When I press save for later
  Then I will be asked to sign in or continue as guest (see screenshot)

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page>Validate functionality for Registerd user
  Given I am on the PSP page OR PDP page OR my bag page on an individual product OR on the saved for later carousel at the bottom of my bag
  When I press save for later
  Then it will save in my saved items
  Given I am signed in
  When I sign out
  And save a product for later
  Then I will be asked whether I want to sign in or continue as guest

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page>Validate Saved Item page details
  Given I have saved an item
  When I am on the my saved items page
  Then I can see total number of saved items,item title (link to PDP),image (link to PDP)
  And I can see was, then, now price or just price if no was, then, now,% off if applicable
  And I can see add to bag CTA or choose item options CTA
  And I can see  remove CTA,Add to bag options

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items page>Validate Single SkU and Multiple SKU item
  Given I am on my saved items page
  When I have saved a single SKU item
  Then I see an add to bag CTA
  And can add the product straight to bag
  Given I am on my saved items page
  When I have saved an item with multiple SKUs (colour or size)
  Then I see a choose item options CTA
  And once I select it I can choose SKU options (as per PDP)
  Then add to bag

@manual @DDAI-289
Scenario: Navigate to Debenhams my saved items>Vaidate item added to bag notification
  Given I am on my saved items
  When I add a product to my bag
  Then I see the item added to bag notification

@manual @DDAI-131
Scenario: Navigate to Debenhams my saved items>Validate remove item popup

@manual @DDAI-131
Scenario: Navigate to Debenhams my saved items>Validate remove single and multiple Items

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
