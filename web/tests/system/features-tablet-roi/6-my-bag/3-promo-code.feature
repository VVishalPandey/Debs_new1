Feature: Validate Remember - Merge promo codes on sign in

@manual @DDAI-796
Scenario: Validate guest user basket with promocode applied in it gets merged with registered user's empty basked if guest user gets login with valid user name and password, Promocode should still be there in basket after login 

@manual @DDAI-796
Scenario: Validate guest user basket with promo code applied in it gets merged with registered user's basket which is already having one promo code applied in it, if guest user gets login with valid user name and password, basket should contain promo code (which is applicable) and error message for other one that "your basket is not eligible for this promotion"

@manual @DDAI-796
Scenario: Validate guest user without promotion applied in basket gets merged with registered user's basket which is already having some promotion applied in it if guest user gets login with valid user name and password, Promocode should still be there in basket after login 

@manual @DDAI-796
Scenario: Validate merge promo code functionality, same promo code being applied by both registered and guest user.

@manual @DDAI-796
Scenario: Validate add promo code as guest then create account, promo code should still be valid and display.

@manual @DDAI-796
Scenario: Registered user to apply one time promo code and as a guest user apply another one time promo code on another device, should work same as desktop.

@manual @DDAI-796
Scenario: Registered user to apply normal promo code and as a guest user apply another one time promo code on another device, should work same as desktop.

@manual @DDAI-794
Scenario: Validate another user is able to use one time promo code after 1 hr(time out) if it is applied by a another guest user but not used. 

@manual @DDAI-794
Scenario: Validate another user is not able to use one time promo code before 1 hr(time out) if it is applied by a another guest user but not used.

@manual @DDAI-794
Scenario: Validate another user is able to use one time promo code before 1 hr(time out) if it is applied and removed by a another guest user.
