
Feature: Validate Join beauty club component on order confirmation Page

@notAutomated @DEBD-3963
Scenario Outline: Sign into beauty club card section with user having no linked card and validate the Join Beauty club on Order confirmation page
    Given I navigate to "homeURL"
    And I should see "myBeautyClubLink" exist on "commonPage"
    When I click on "myBeautyClubLink" on "commonPage"
    Then I should see "headerTitleText" as "Join Beauty Club" on "beautyClubPage"
    And I should see "headerSubTitleText" as "To join Beauty Club or to link your card to your account, please sign in or create a Debenhams.com account" on "beautyClubPage"
    When I click on "tab1" on "beautyClubPage"
    And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
    And I enter "<password>" in "passwordField" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "noCardLinkedHeaderText" as "No Beauty Club Card linked" on "beautyClubPage"
    And I should see "noCardLinkedText" as "Link your card to your Debenhams account so you can:" on "beautyClubPage"
    And I should see "linkCardButton" exist on "beautyClubPage"
    Then I navigate to "chanelPDP"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    Then I navigate to delivery options as registered user with UK address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    And I should see "orderNumber" exist on "orderConfirmationPage"
    Then I should see "joineBeautyClubComponent" exist on "orderConfirmationPage"
    And I should see "beautyClubImage" exist on "orderConfirmationPage"
    And I should see "beautyClubJoinText" as "Join Beauty Club" on "beautyClubPage"
    And I should see "beautyClubJoinText1" as "You'll collect 3 points for every £1 spent" on "beautyClubPage"
    And I should see "beautyClubJoinText2" as "Enjoy Free delivery on all beauty or fragrance orders" on "beautyClubPage"
    And I should see "JoinNowButton" exist on "orderConfirmationPage"
    And I should see "beautyClubIcon" exist on "orderConfirmationPage"
    And I should see "beautyClubJoinText3" as "Beauty Club reward points could have been earned with your order" on "beautyClubPage"
    Examples:
    | email                      | password  | signedInHeaderTitle |
    | testautomationd8@gmail.com | password7 | Hello Test         |

@notAutomated @DEBD-3963
Scenario: valid join beauty club after clicking join button on order confirmation page
  When I click on "JoinNowButton" on "orderConfirmationPage"
  Then the user should be registered with Beauty Club Card

@notAutomated @DEBD-3963
Scenario: validate join beauty club does not display when the  order placed with non beauty products
  Then I navigate to "dressPDP"
  And I select available size and add to bag on pdpPage
  When I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  When I should scroll to "checkoutButton" on "myBagPage"
  Then I navigate to delivery options as registered user with UK address
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
  And I click "placeOrderButton" on "paymentPage"
  And I should see "orderNumber" exist on "orderConfirmationPage"
  Then I should not see "joineBeautyClubComponent" on "orderConfirmationPage"
  And I should not see "beautyClubImage" exist "orderConfirmationPage"


@notAutomated @DEBD-3963
Scenario Outline: validate order confirmation page for the user already having linked beauty card
    Given I logout
    Given I navigate to "homeURL"
    And I should see "myBeautyClubLink" exist on "commonPage"
    When I click on "myBeautyClubLink" on "commonPage"
    Then I should see "headerTitleText" as "Join Beauty Club" on "beautyClubPage"
    And I should see "headerSubTitleText" as "To join Beauty Club or to link your card to your account, please sign in or create a Debenhams.com account" on "beautyClubPage"
    When I click on "tab1" on "beautyClubPage"
    And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
    And I enter "<password>" in "passwordField" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
     And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "dashboardTab1" as "My points" on "beautyClubPage"
    And I should see "dashboardTab2" as "My rewards" on "beautyClubPage"
    And I should see "beautyPoints" exist on "beautyClubPage"
    And I should not see "noCardLinkedHeaderText" on "beautyClubPage"
    And I should not see "noCardLinkedText" on "beautyClubPage"
    And I should not see "linkCardButton" on "beautyClubPage"
    Then I navigate to "chanelPDP"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    When I should scroll to "checkoutButton" on "myBagPage"
    Then I navigate to delivery options as registered user with UK address
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    And I should see "orderNumber" exist on "orderConfirmationPage"
    Then I should not see "joineBeautyClubComponent" on "orderConfirmationPage"
    And I should not see "beautyClubImage" exist "orderConfirmationPage"

    Examples:
        | email                      | password  | signedInHeaderTitle |
        | testautomationd3@gmail.com | password3 | Hello Test         |

@notAutomated @DEBD-3963
Scenario: validate beauty clucb card is not displaying on order confirmation page for guest user
    Given I navigate to "testBeautyLipGlowfPdpURL"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I navigate to delivery options as guest user
    When I select home delivery and provide UK address details and navigate to delivery options under it
    When I click on "standardOption" on "deliveryOptionPage"
    Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    And I should see "orderNumber" exist on "orderConfirmationPage"
    Then I should not see "joineBeautyClubComponent" on "orderConfirmationPage"
    And I should not see "beautyClubImage" exist "orderConfirmationPage"

@notAutomated @DEBD-3963
Scenario: validate beauty clucb card is not displaying on order confirmation page for ghost user
    Given I navigate to "dressPDP"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I select available size and add to bag on pdpPage
    When I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I navigate to delivery options as ghost user with UK address
    When I click on "standardOption" on "deliveryOptionPage"
    Then I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    When I enter "Debenhams Card details" in "Cardrequiredfields" on "paymentPage"
    And I click "placeOrderButton" on "paymentPage"
    And I should see "orderNumber" exist on "orderConfirmationPage"
    Then I should not see "joineBeautyClubComponent" on "orderConfirmationPage"
    And I should not see "beautyClubImage" exist "orderConfirmationPage"


