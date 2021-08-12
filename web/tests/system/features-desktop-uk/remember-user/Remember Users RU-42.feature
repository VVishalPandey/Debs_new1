Feature: Verify the functionality of the remembered customers when browser closed

@manual @DDAI-789 @awsManual
Scenario: Validate that the basket page is in sync for the tablet/mobile for the remembered customer when browser closed
  Given the user is logged in 
  When the items are added in the basket page 
  And the Browser is closed and opened again 
  And I view the Basket Page
  Then I should see all the items added in the basket page on the mobile/tablet for the same remembered user

@manual @DDAI-789 @awsManual
Scenario: Validate that the count of the items in minibag is updated for the tablet/mobile when the user is logged in as remembered customer
  Given the user is logged in 
  When the items are added in the basket page for the tablet/mobile site 
  And the quantity of the items in the basket page is updated 
  And the Browser is closed and opened again 
  And I view the mini bag
  Then I should see the updated count with updated quantities on the minibag for the remembered user on the mobile/tablet

@manual @DDAI-789 @awsManual
Scenario: Validate that the saved for later item page is in sync on the mobile/tablet for the remembered customer
  Given the user is logged in 
  When the items are added in the basket page 
  And the items are added in the "Saved for Later" page
  And the Browser is closed and opened again for the remembered user
  And I go to the Saved for later page
  Then I should see the same items in the Saved for later for the remembered user on the tablet

@manual @DDAI-789 @awsManual
Scenario: Validate that the basket page is showing as updated for the guest user
  Given the user is 'guest' user
  When the items are added in the basket page for the guest user
  And the Browser is closed and opened again for the guest user
  And I view the Basket Page
  Then I should see all the items added in the basket page on the mobile/tablet for the guest useR

@manual @DDAI-789 @awsManual
Scenario: Validate that the mini bag is showing as updated for the guest user
  Given the user is 'guest' user
  When the items are added in the basket page for the guest user
  And the Mini bag is showing as updated with the same number of quantities
  And the Browser is closed and opened again for the guest user
  And I view the mini bag
  Then I should see the same count showing as updated in the minibag