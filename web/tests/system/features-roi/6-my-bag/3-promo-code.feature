Feature: Test Debenhams promo code validation from my bag

@automated @DDAI-182
Scenario: Navigate to Debenhams my bag page and validate error message for empty promo code field
  Given I navigate to "womenDressesPdpUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage
  #And I click on "countrySelectorpopupclose" on "commonPage"
  #Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  #Then I click on "countryIreland" on "commonPage"
  #Then I click on "countryselectorbtn" on "commonPage"
  Then I should not see "sizeswatch" on "pdpPage"
  Then I select available size and add to bag on pdpPage
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  When I click on "promoCodeAccordionInt" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeErrorMessage" as "Please enter a promotional code." on "myBagPage"
#Then I remove all the items in my bag

@automated @DDAI-182
Scenario Outline: Navigate to Debenhams my bag page and validate error message for incorrect promo code field
  #Given I navigate to "womenDressesPdpUrl"
  Then I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessageInt" as "Sorry that promotional code was not recognised, please check and try again." on "myBagPage"
  #Then I remove all the items in my bag

  Examples:
    | promoCode |
    | aaaa      |

@automated @DDAI-182
Scenario Outline: Navigate to Debenhams my bag page and validate that promo code is applied successfully
  Then I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  Then I should see "productDiscountValue" exist on "myBagPage"
  #Then I validate "discountValue" as "<discount>" on "myBagPage"

  Examples:
    | promoCode | promoMessage  | discount |
    | PS01      | PS01: Applied | -$0.01   |


@automated @DDAI-182
Scenario Outline: Navigate to Debenhams my bag page and validate that message for duplicate promo code
  Then I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessageInt" as "<promoHeaderErrorMessage>" on "myBagPage"
  # Then I remove all the items in my bag

  Examples:
    | promoCode | promoHeaderErrorMessage                             | promoMessage  |
    | PS01      | You have entered a duplicate promotion code "PS01". | PS01: Applied |


@automated @DDAI-182
Scenario: Navigate to Debenhams my bag page from above scenario and validate the discounts after removing the promo code
  Then I click on "promoCodeRemove" on "myBagPage"
  Then I should not see "promoCodeAppliedText" on "myBagPage"
  And I should not see "promoCodeRemove" on "myBagPage"
  Then I remove all the items in my bag


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
