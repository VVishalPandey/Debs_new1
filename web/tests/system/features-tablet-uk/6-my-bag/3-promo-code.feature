Feature: Test Debenhams promo code validation from my bag

@automated @DBMTE-114
Scenario: Navigate to Debenhams my bag page and validate error message for empty promo code field
  Given I logout
  And I am on my details page
  #Given I navigate to "basketCheckoutUrl"
  And I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  And I add the product to bag and go to my bag page
  Then I should see "testDressProductName" product name exist on myBagPage
  And I should not see "checkoutButton" on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"
  When I click on "promoCodeAccordion" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeErrorMessage" as "Please enter a promotional code." on "myBagPage"

@automated @DBMTE-114
Scenario Outline: Navigate to Debenhams my bag page and validate error message for incorrect promo code field
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessage" as "<promoErrorMessage>" on "myBagPage"

  Examples:
    | promoCode | promoErrorMessage                                                           |
    | aaaa      | Sorry that promotional code was not recognised, please check and try again. |

@manual @DBMTE-114
Scenario Outline: Navigate to Debenhams my bag page and validate that promo code and discont is applied successfully
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  Then I should see "productDiscountValue" exist on "myBagPage"
  And I validate "discountValue" as "<discount>"

  Examples:
    | promoCode | promoMessage  | discount |
    | PS01      | PS01: Applied | -£0.01   |

@automated @DBMTE-114
Scenario Outline: Navigate to Debenhams my bag page and validate that message for duplicate promo code
  When I enter "<promoCode>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeErrorMessage" as "<promoErrorMessage>" on "myBagPage"

  Examples:
    | promoCode | promoErrorMessage                                                                   |
    | PS01      | The promotional code you have entered cannot be applied as it has already been used |

@manual @DBMTE-114
Scenario Outline: Navigate to Debenhams my bag page from above scenario and validate the discounts after removing the promo code
  When I click on "promoCodeRemove" on "myBagPage"
  Then I validate "discountValue" as "<discount>"
  And I should not see "promoCodeAppliedText" on "myBagPage"
  And I should not see "promoCodeRemove" on "myBagPage"

  Examples:
    | discount |
    | £0.00    |

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
