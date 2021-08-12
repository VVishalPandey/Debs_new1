Feature: Verify the functionality of the Saved for item on pspPage

@manual @DDAI-790 
Scenario: Validate that the Signin Pop up should not appear on click of SFL on pspPage if user is already Signin
  Given the user is logged in as "remembereduser"
  When I click on "Saved item" on "pspPage"
  Then I should see the item saved in "Saved for later"
  And  SignIn pop up shouldn't appear

@manual @DDAI-790 
Scenario: Validate that the Signin Pop up should appear on click of SFL on pspPage for guest user
  Given the user is logged in as "Guestuser"
  When I click on "Saved item" on "pspPage"
  Then I should see the item saved in "Saved for later"
  And I should be asked whether I want to sign in or continue as guest for first time

@manual @DDAI-790 
Scenario: Validate that the item is getting back on the basket page from the Saved for later 
  Given the user is logged in as "remembereduser"
  When I click on "Saved item" on "pspPage"
  And  SignIn pop up shouldn't appear
  And I should see the item saved in "Saved for later"
  And I add the item back to the basket from the "Saved for later"
  Then I should see the item added back to the Basket 

@manual @DDAI-790 
Scenario:Validate that the Signin Pop up should not appear on click of SFL again on pspPage for guest user
  Given the user is logged in as "Guestuser"
  When I click on "Saved item" on "pspPage"
  And I should be asked whether I want to sign in or continue as guest for first time
  And I choose continue shopping 
  And I click on SFL on another item on psp
  Then I should see the item saved in "Saved for later"
  And I should not see the signin pop
