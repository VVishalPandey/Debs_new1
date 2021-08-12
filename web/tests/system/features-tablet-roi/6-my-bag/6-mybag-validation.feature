Feature: Validate Merge products on sign in

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Beauty and Dresses) in it gets merged with registered user's empty basked if guest user gets login with valid user name and password from checkout login page, basket should contain Beauty and dresses products

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Furniture) in it gets merged with registered user's basket which is already having some products(Beauty) in it if guest user gets login with valid user name and password from checkout PSP, basket should contain both Beauty and Furniture products

@manual @DDAI-800
Scenario: Validate guest user empty basket gets merged with registered user's basket which is already having some products(Bundle) in it if guest user gets login with valid user name and password from checkout PDP, basket should contain bundle products

@manual @DDAI-800
Scenario: Validate guest user basket with some products(Beauty) in it , should not get merged with registered user's basked with some products(Dresses) if guest user gets login with valid user name and password from checkout login page, basket should contain dresses products of guest basket and other products(Beauty) should get removed.

@manual @DDAI-800
Scenario: Validate below scenario : Mobile 1 -> login -> add product x , Now  on Tablet 1 -> guest -> add product y -> login at checkout, Now Mobile 1 -> add product z -> minibag should be updated with y+z (x to be removed)
