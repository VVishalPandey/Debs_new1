Feature: Verify the functionality of the remembered users on the multi devices

@manual @DDAI-797 
Scenario: Validate that the session timeout of the remembered user on multi devices
  Given the user is logged in as "remembered user" on tablet at 1200
  And the products are already added in the basket page
  When the same user is logged in on mobile device at 1215
  And the same user is logged in on desktop device at 1230
  Then the session should maintain individually for the devices
  And the session should not be timed out at 1230 on the mobile/desktop
  And the user should keep continue browsing on the site 
  And the session should be timed out on tablet at 1230

@manual @DDAI-797 
Scenario: Validate that the the checkout flow for the remembered user
  Given the user is logged in as "remembereduser" on tablet at 1200
  And the products are already added in the basket page
  When the same user is logged in on mobile device at 1215
  Then the session should maintain individually for the mobile device
  And the user should be able to click on the checkout button on basket page
  And user should be able to proceed after checkout flow

@manual @DDAI-797 
Scenario: Validate that the the mini bag is updated for the user is logged in to multiple devices
  Given the user is logged in to the tablet
  And the products are already added in the basket page
  When the same user is logged in on mobile/desktop device 
  And the user add products on the tablet site
  And the mini bag should be updated with the items on the tablet
  Then the mini bag for the mobile/desktop should also be updated with the same items