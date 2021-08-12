Feature: Test Debenhams  guest journey as a CCC Employee

@automated @DEBD-1987 @DEBD-1971
Scenario: Validate CSR user has been redirected to debenhams site as a guest flow
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "shopOnBehalfOfCustomerCTA" on "cccLoginPage"
  Then I should see "cccshopOnBehalfBanner" containing "You are shopping on behalf of a Guest Customer" on "cccLoginPage"
  And I should see "searchIcon" exist on "commonPage"
  And I should see "savedItemsButton" exist on "commonPage"
  And I should see "myBagButton" exist on "commonPage"
  And I should see "storeFinderLink" exist on "commonPage"
  And I should see "myAccountLink" exist on "commonPage"
  And I should see "notYouLink" exist on "commonPage"
  And I should not see "createAccountLink" on "commonPage"

@automated @DEBD-1987 @DEBD-1971
Scenario: Validate the product gets added in my when user select add to bag
  When I navigate to "testCoffeePdpURL"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "testCoffeeProductName" product name exist on myBagPage
  And I store details from myBag to validate later

@notAutomated @DEBD-1987
Scenario: Navigate to payments page with new delivery address and delivery option selected as standard
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as guest user
  When I select home delivery and provide UK address details and navigate to delivery options under it
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  Then I should see "headerText" as "Your order" on "paymentPage"

@notAutomated @DEBD-1987
Scenario: On Payment page add a new delivery address which handle PCA address also
  When I am in view of "billingAddressHeaderText" on "paymentPage"
  Then I should see "billingAddressHeaderText" as "Billing Address" on "paymentPage"
  And I should see "newAddressText" as "Use new billing address" on "paymentPage"
  Then I am in view of "newAddressText" on "paymentPage"
  When I click on "newAddressText" on "paymentPage"
  Then I select new billing address and provide UK address details and use this address
  And I should see "editAddressLink" exist on "paymentPage"
  And I should not see "findAddressButton" on "paymentPage"
  And I should not see "useAddressButton" on "paymentPage"
  And I should not see "bfpoLink" on "paymentPage"
  And I should not see "searchPostcodeLink" on "paymentPage"
  And I should not see "enterAddressManuallyLink" on "paymentPage"

@notAutomated @DEBD-1987
Scenario Outline: Add a Credit  card and make the payment
  And I click on "beInTheNowText" on "paymentPage"
  Then I should see value of "creditCardIDField" as "<cc_number>" on "paymentPage"
  And I should see "creditCardExpiryMonth" exist on "paymentPage"
  And I should see "creditCardExpiryYear" exist on "paymentPage"
  And I should see "creditCardSecurityNumber" exist on "paymentPage"
  And I should see "creditCardDigitsText" as "<sec_num_digits_text>" on "paymentPage"
  And I validate "title" of "creditCardIconOnField" as "<icon_type>" on "paymentPage"
    Then I click on "placeOrderButton" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  |      cc_number      |
    |   4111111111111111 | visa      | 3 digits on the back | 4111 1111 1111 1111 |

@notAutomated @DEBD-1987
Scenario: Validate the web loyalty pop up on order confirmation page and print the order number
  Then I should see "webLoyaltyPopUp" exist on "orderConfirmationPage"
  And I should see "webLoyaltySection" exist on "orderConfirmationPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"


@notautomated @DEBD-1987 
Scenario Outline: Validate the guest checkout for ccc user
  Given I logout
  And I am logged in as CCC user
  When I navigate to "testBeautyLipGlowfPdpURL"
  And I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I should scroll to "checkoutButton" on "myBagPage"
  And I click on "checkoutButton" on "myBagPage"
  And I should not see "SignInPopUp" contains "myBagPage"
  And I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I select home delivery and provide UK address details and navigate to delivery options under it
  And I click on "nextNominatedOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I click on "newAddressText" on "paymentPage"
  And I select new billing address and provide UK address details and use this address
  And I should not see "savedCreditCard" contains "paymentPage"
  And I enter "<credit_card_number>" in "creditCardIDField" on "paymentPage"
  And I click on "creditCardDateJanMonth" on "paymentPage"
  And I click on "creditCardDateNextYear" on "paymentPage"
  And I enter "<security_num>" in "creditCardSecurityNumber" on "paymentPage"
  Then I click on "placeOrderButton" on "paymentPage"

  Examples:
    | credit_card_number | icon_type | sec_num_digits_text  | cc_number           | security_num |
    | 4000000000000002   | visa      | 3 digits on the back | 4000 0000 0000 0002 | 123          |


@notautomated @DEBD-1987 @DEBD-1991
Scenario Outline: Validate the cc user doesn't have access to a customer saved information
  Given I click on "debsLogo" on "commonPage"
  And I should see "minibagProductCountOnHover" as "0 items" on "minibagPage"
  When I navigate to "testBeautyLipGlowfPdpURL"
  And I select available size and add to bag on pdpPage
  And I click on "viewBasketCheckoutButton" on "pdpPage"
  And I should scroll to "checkoutButton" on "myBagPage"
  And I click on "checkoutButton" on "myBagPage"
  And I should not see "SignInPopUp" contains "myBagPage"
  And I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I should not see "useAddressDropDown" on "homeDeliveryPage"
  And I select home delivery and provide UK address details and navigate to delivery options under it
  And I click on "nextNominatedOption" on "deliveryOptionPage"
  And I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I click on "newAddressText" on "paymentPage"
  And I select new billing address and provide UK address details and use this address
  And I should not see "savedCreditCard" contains "paymentPage"

  
@notautomated @DEBD-1987 @DEBD-1991
Scenario Outline: Validate the cc user doesn't have access to a customer saved information
  Given I click on "clearRestartButton" on "(.*?)"
  When I click on "debsLogo" on "commonPage"
  And I should see "minibagProductCountOnHover" as "0 items" on "minibagPage"
  And I navigate to "testDiscountPDPURL"
  And I click on "saveLaterIcon" on "pdpPage"
  Then I click on "clearRestartButton" on "(.*?)"
  And I should see "saveItemCountOnHover" as "0 items" on "minibagPage"