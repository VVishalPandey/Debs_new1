Feature: Test functionality of promo codes on my bag and Payment page Save For CCC user

@automated @DEBD-1989
Scenario Outline: Validate CSR user is able to apply and remove promo codes on my bag page
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testChanelPerfPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I enter "<promocodes>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "<promoMessage>" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  And I click on "promoCodeRemove" on "myBagPage"
  Then I should not see "promoCodeRemove" on "myBagPage"
    Examples:
    | promocodes | promoMessage                                                                                   |
    | CCCNDH     | CCCNDH: Ready to be applied, please select "NEXT DAY DELIVERY" option at checkout              |
    | CCCSTN     | CCCNDH: Ready to be applied,                                                                   |
    | CCCNOM     | CCCNOM: Ready to be applied, please select "NAMED DAY DELIVERY" option at checkout             |
    | CCCNEXEV   | CCCNEXEV: Ready to be applied, please select "NEXT EVENING DELIVERY" option at checkout Remove |
    | CCCNOMEV   | CCCNOM: Ready to be applied, please select "NAMED DAY DELIVERY" option at checkout             |
    | CCC05      | 5% off; 5% off                                                                                 |
    | CCC10      | 10% off; 10% off                                                                               |
    | CCC15      | 15% off; 15% off                                                                               |
    | CCC20      | 20% off; 20% off                                                                               |
    | CCC25      | 25% off; 25% off                                                                               |
    | CCC30      | 30% off; 30% off                                                                               |
    | CCC40      | 40% off; 40% off                                                                               |
    | CCC50      | CCC50 - 50% customer enactment solution; 50% off                                               |

@automated @DEBD-1989
Scenario Outline: Validate CSR user is not able to apply invalid promo codes on my bag page
  When I enter "<promocodes>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessage" as "<ErrorMessage>" on "myBagPage"

  Examples:
    | promocodes | ErrorMessage                                                                                   |
    | CCCCCC     | Sorry that promotional code was not recognised, please check and try again.                    |
    | PS01       | The promotion code you have entered is not available at this time. Please try again later.     |


@automated @DEBD-1989 @issue
Scenario Outline: Validate  CSR user is able to apply/remove on payment page
  When I click on "checkoutButton" on "myBagPage"
  When I select home delivery and provide UK address details
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I click on "promoCodeAccordion" on "paymentPage"
  When I enter "<promocodes>" in "promoCodeInputField" on "paymentPage"
  And I click on "promoCodeApply" on "paymentPage"
  Then I should see "promoCodeAppliedNotificationMessage" as "<promoMessage>" on "paymentPage"
  And I should validate "promoCodeRemoveLink" exist on "paymentPage"
  And I click on "promoCodeRemoveLink" on "myBagPage"
  Then I should not see "promoCodeRemoveLink" on "paymentPage"
    Examples:
    | promocodes | promoMessage                                                                                   |
    | CCCNDH     | CCCNDH: Ready to be applied, please select "NEXT DAY DELIVERY" option at checkout              |
    | CCCSTN     | CCCNDH: Ready to be applied,                                                                   |
    | CCCNOM     | CCCNOM: Ready to be applied, please select "NAMED DAY DELIVERY" option at checkout             |
    | CCCNEXEV   | CCCNEXEV: Ready to be applied, please select "NEXT EVENING DELIVERY" option at checkout Remove |
    | CCCNOMEV   | CCCNOM: Ready to be applied, please select "NAMED DAY DELIVERY" option at checkout             |
    | CCC05      | 5% off; 5% off                                                                                 |
    | CCC10      | 10% off; 10% off                                                                               |
    | CCC15      | 15% off; 15% off                                                                               |
    | CCC20      | 20% off; 20% off                                                                               |
    | CCC25      | 25% off; 25% off                                                                               |
    | CCC30      | 30% off; 30% off                                                                               |
    | CCC40      | 40% off; 40% off                                                                               |
    | CCC50      | CCC50 - 50% customer enactment solution; 50% off                                               |

@automated @DEBD-1989
Scenario Outline: Validate CSR user is not able to apply invalid promo codes on my bag page
  When I enter "<promocodes>" in "promoCodeField" on "paymentPage"
  And I click on "promoCodeApply" on "paymentPage"
  Then I should see "promoCodeHeaderErrorMessage" as "<ErrorMessage>" on "paymentPage"

  Examples:
    | promocodes | ErrorMessage                                                                                   |
    | CCCCCC     | Sorry that promotional code was not recognised, please check and try again.                    |
    | PS01       | The promotion code you have entered is not available at this time. Please try again later.     |

@notAutomated @DEBD-1989
Scenario Outline: Validate the CCC coupons are not appliable for standard UK/IE sites
  Given I logout
#   for both DOTCOM and DOTIE
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I enter "<promocodes>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeHeaderErrorMessage" as "Sorry that promotional code was not recognised, please check and try again." on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details and navigate to delivery options under it
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I click on "promoCodeAccordion" on "paymentPage"
  When I enter "<promocodes>" in "promoCodeInputField" on "paymentPage"
  And I click on "promoCodeApply" on "paymentPage"
  Then I should see "promoCodeHeaderErrorMessage" as "Sorry that promotional code was not recognised, please check and try again." on "myBagPage"
    Examples:
        | promocodes |
        |   CCCNDH   |
        |   CCC10    |
        |   CCC10    |

@manual @DEBD-1989
Scenario Outline: Validate discounts are getting applied when discount promo codes added on mybag page
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testChanelPerfPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  When I enter "<promocodes>" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  And I should validate "promoCodeRemove" exist on "myBagPage"
  And I should see "<discount% >" applied on "myBagPage"

  Examples:
    | promocodes | promoMessage        | discount% |
    | CCC05      | CCC05: CCC05applied | 5         |
    | CCC10      | CCC10: CCC10applied | 10        |
    | CCC15      | CCC15: CCC15applied | 15        |
    | CCC20      | CCC20: CCC20applied | 20        |
    | CCC25      | CCC25: CCC25applied | 25        |
    | CCC30      | CCC30: CCC30applied | 30        |
    | CCC40      | CCC40: CCC40applied | 40        |
    | CCC50      | CCC50: CCC50applied | 50        |

@manual @DEBD-1989
Scenario Outline: Validate discounts are getting applied when discount promo codes added on payment page
  Given I logout
  When I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  When I "Remove" "all" products from "myBagPage"
  And I navigate to "testChanelPerfPdpURL"
  When I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testDressProductName" product name exist on myBagPage
  And I validate the "banner message"
  When I click on "checkoutButton" on "myBagPage"
  Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
  And I click on "useThisAddressButton" on "homeDeliveryPage"
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  When I enter "<promocodes>" in "promoCodeField" on "paymentPage"
  And I click on "promoCodeApply" on "paymentPage"
  And I should validate "promoCodeRemove" exist on "paymentPage"
  And I should see "<discount% >" applied on "paymentPage"

  Examples:
    | promocodes | promoMessage        | discount% |
    | CCC05      | CCC05: CCC05applied | 5         |
    | CCC10      | CCC10: CCC10applied | 10        |
    | CCC15      | CCC15: CCC15applied | 15        |
    | CCC20      | CCC20: CCC20applied | 20        |
    | CCC25      | CCC25: CCC25applied | 25        |
    | CCC30      | CCC30: CCC30applied | 30        |
    | CCC40      | CCC40: CCC40applied | 40        |
    | CCC50      | CCC50: CCC50applied | 50        |

@manual @DEBD-1989
Scenario: Validate is not able to apply coupon again on payment page which has already been applied on my bag page
   Given I logout
    When I am enacting as a guest using CCC
    When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
    When I "Remove" "all" products from "myBagPage"
    And I navigate to "testChanelPerfPdpURL"
    When I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I should see "testDressProductName" product name exist on myBagPage
    And I validate the "banner message"
    When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    When I click on "homeDeliveryOption" on "deliveryOptionPage"
    And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
    And I click on "useThisAddressButton" on "homeDeliveryPage"
    Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
    And I click on "standardOption" on "deliveryOptionPage"
    Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "<promocodes>" in "promoCodeField" on "myBagPage"
    And I click on "promoCodeApply" on "myBagPage"
     When I click on "checkoutButton" on "myBagPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    When I click on "homeDeliveryOption" on "deliveryOptionPage"
    And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
    And I click on "useThisAddressButton" on "homeDeliveryPage"
    Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
    And I click on "standardOption" on "deliveryOptionPage"
    Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    And I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "<Same promocodes>" in "promoCodeField" on "paymentPage"
    And I click on "promoCodeApply" on "paymentPage"
    Then I should see "promoError" exist on "PaymentPage"
    And promo code should not be applied

@manual @DEBD-1989
Scenario: Validate the normal coupons are working fine  for standard UK/IE sites
  Given I logout
  #   for both DOTCOM and DOTIE
  When I navigate to "testDressPdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "myBagPageHeader" exist on "myBagPage"
  When I enter "PS01" in "promoCodeField" on "myBagPage"
  And I click on "promoCodeApply" on "myBagPage"
  Then I should see "promoCodeAppliedText" as "SuccessMessage" on "myBagPage"
  When I click on "checkoutButton" on "myBagPage"
  When I select home delivery and provide UK address details
  Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
  And I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive" on "deliveryOptionPage"
  And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I click on "promoCodeAccordion" on "paymentPage"
  When I enter "<promocodes>" in "promoCodeInputField" on "paymentPage"
  And I click on "promoCodeApply" on "paymentPage"
  Then I should see "promoCodeAppliedNotificationMessage" as "SuccessMessage" on "paymentPage"


