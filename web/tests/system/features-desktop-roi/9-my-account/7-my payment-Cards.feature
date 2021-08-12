Feature: Test Debenhams My payment cards page under my account


@notAutomated @ECOMMUI-2 @DEBD-1199 @DEBD-195 @DEBD-2879
Scenario Outline: My Account - validate validate only  beauty & gift card options available for existing User having no saved cards
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "pageTitle" as "My account" on "myDetailsPage"
  And I remove "paymentcard" on My Account Page
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I should see "titleOfPage" as "My payment cards" on "myDetailsPage"
  And I should see "backNavigationButton" exist on "myDetailsPage"
  And I should see "addNewPaymentCardButton" exist on "myDetailsPage"
  When I click on "addNewPaymentCardButton" exist on "myDetailsPage"
  Then I should see "rewardCardRadioButtin" exist on "myDetailsPage"
  And I should see "giftCardRadioButtin" exist on "myDetailsPage"
  And I should not see "cardsdropdown" on "myDetailsPage"
  And I should not see "credit/debitCardOption" on "myDetailsPage"
  And I should not see "storeCardOption" on "myDetailsPage"
  And I should see "billingAddressDropdown" exist on "myDetailsPage"
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "county" exist on "myDetailsPage"
  And I should see "Eircode" exist on "myDetailsPage"
  And I should see "savePaymentCardButton" exist on "myDetailsPage"

    Examples:
    | email              | password |
    | testvad1@gmail.com | test1234 |

@notAutomated @ECOMMUI-2 @DEBD-1199 @DEBD-195
Scenario Outline: My Account - validate user is able to add/delete reward card  for existing User having no saved cards
 When I click on "rewardCardRadioButtin" on "myDetailsPage"
 And I enter "<rewardCard>" in "rewardField" on "myDetailsPage"
 And I enter valid ROI address in billing address
 And I click "AddPaymentCardButton" on "myDetailsPage"
 Then I should see "cardAddedSection" exists on "myDetailsPage"
 When I click on "removeCardButton" on "myDetailsPage"
 Then I should see "removePopUp" on "myDetailsPage"
 And I should see "removetext" as "Are you sure you want to delete the payment method?" on "myDetailsPage"
 And I should see "yesButton" on "myDetailsPage"
 And I shouls see "noButton" on "myDetailsPage"
 When I click on "YesButton" on "myDetailsPage"
 Then I should not see "cardAddedSection" on "myDetailsPage"
 When I click on "addNewPaymentCardButton" on "myDetailsPage"
 And I enter "<rewardCard>" in "rewardField" on "myDetailsPage"
 And I enter valid UK address in address field
 And I click "AddPaymentCardButton" on "myDetailsPage"
 Then I should see "cardAddedSection" exists on "myDetailsPage"
   Examples:
    | reward             |
    | 6335865860590693   |

@notAutomated @ECOMMUI-2
Scenario Outline: My Account - validate user is able to add/delete gift card  for existing User having no saved cards
 When I click on "GiftCardRadioButtin" on "myDetailsPage"
 And I enter "<giftCard>" in "rewardField" on "myDetailsPage"
 And I enter valid ROI address in billing address
 And I click "AddPaymentCardButton" on "myDetailsPage"
 Then I should see "cardAddedSection" exists on "myDetailsPage"
 When I click on "removeCardButton" on "myDetailsPage"
 Then I should see "removePopUp" on "myDetailsPage"
 And I should see "removetext" as "Are you sure you want to delete the payment method?" on "myDetailsPage"
 And I should see "yesButton" on "myDetailsPage"
 And I shouls see "noButton" on "myDetailsPage"
 When I click on "YesButton" on "myDetailsPage"
 Then I should not see "cardAddedSection" on "myDetailsPage"
 When I click on "addNewPaymentCardButton" on "myDetailsPage"
 And I enter "<giftCard>" in "rewardField" on "myDetailsPage"
 And I enter valid UK address in address field
 And I click "AddPaymentCardButton" on "myDetailsPage"
 Then I should see "cardAddedSection" exists on "myDetailsPage"
   Examples:
    | giftCard             |
    | 6335865860590693   |


@notAutomated @ECOMMUI-2 @DEBD-1199 @DEBD-195
Scenario: My Account - validate user is able to add reward/gift card only for existing User having saved cards
  Given I logout
  And I am on my details page
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  When I click on "myPaymentCardsButton" on "myDetailsPage"
  Then I should see "titleOfPage" as "My payment cards" on "myDetailsPage"
  And I should see "backNavigationButton" exist on "myDetailsPage"
  And I should see "addNewPaymentCardButton" exist on "myDetailsPage"
  When I click on "addNewPaymentCardButton" exist on "myDetailsPage"
  Then I should see "rewardCardRadioButtin" exist on "myDetailsPage"
  And I should see "giftCardRadioButtin" exist on "myDetailsPage"
  And I should not see "cardsdropdown" on "myDetailsPage"
  And I should not see "credit/debitCardOption" on "myDetailsPage"
  And I should not see "storeCardOption" on "myDetailsPage"


@notAutomated @ECOMMUI-2
Scenario: My Account - validate  credit card number and type is read only on editing existing credit card
 And I click on "backButton" on "myDetailsPage"
 Then I should see "savedCreditCards" exist on "myDetailsPage"
 When I click on "EditPaymentCardCC" on "myDetailsPage"
 Then I should see "cardType" "readonly" on "pspPage"
 And I should see "cardInput" "readonly" on "pspPage"
 And I should see "startMonth" exist on "myDetailsPage"
 And I should see "startYear" exist on "myDetailsPage"
 And I should see "expireMonth" exist on "myDetailsPage"
 And I should see "expireYear" exist on "myDetailsPage"
 And I should see "issueNumber" exist on "myDetailsPage"
 And I should see "namefield" exist on "myDetailsPage"
 And I should see "billingAddressDropdown" exist on "myDetailsPage"

@notAutomated @ECOMMUI-2
Scenario: My Account -Validate  billing address on edit credit card page
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "county" exist on "myDetailsPage"
  And I should see "Eircode" exist on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "savePaymentCardButton" exist on "myDetailsPage"

@manual @ECOMMUI-2
Scenario: My Account - validate user is  able to update existing beauty Card
  And I enter updated billing address
  And I click on update payment details
  Then creditcards details should be updated

@notAutomated @ECOMMUI-2
Scenario: My Account - validate user is  able to edit existing giftCard
  And I click on "backButton" on "myDetailsPage"
  Then I should see "savedGiftCards" exist on "myDetailsPage"
  When I click on "EditPaymentCardGC" on "myDetailsPage"
  And I should see "cardType" exist on "myDetailsPage"
  And I should see "cardInput" exist on "myDetailsPage"
  And I should see "billingAddressDropdown" exist on "myDetailsPage"
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
 And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "county" exist on "myDetailsPage"
  And I should see "Eircode" exist on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "savePaymentCardButton" exist on "myDetailsPage"

@manual @ECOMMUI-2
Scenario: My Account - validate user is  able to update existing beauty Card
  When I enter updated giftCard details
  And I enter updated billing address
  And I click on update payment details
  Then giftCard details should be updated

@notAutomated @ECOMMUI-2
Scenario: My Account - validate user is  able to edit existing rewardCard
  And I click on "backButton" on "myDetailsPage"
  Then I should see "savedRewardsCards" exist on "myDetailsPage"
  When I click on "EditPaymentCardRewards" on "myDetailsPage"
  And I should see "cardType" exist on "myDetailsPage"
  And I should see "cardInput" exist on "myDetailsPage"
  And I should see "billingAddressDropdown" exist on "myDetailsPage"
  And I should see "title" exist on "myDetailsPage"
  And I should see "firstName" exist on "myDetailsPage"
  And I should see "lastName" exist on "myDetailsPage"
  And I should see "phoneNumber" exist on "myDetailsPage"
  And I should see "countryDropDown" exist on "myDetailsPage"
  And I should see "houseNumber" exist on "myDetailsPage"
  And I should see "addressLine1" exist on "myDetailsPage"
  And I should see "addressLine2" exist on "myDetailsPage"
  And I should see "city" exist on "myDetailsPage"
  And I should see "county" exist on "myDetailsPage"
  And I should see "Eircode" exist on "myDetailsPage"
  And I should see "clearAddressLink" exist on "myDetailsPage"
  And I should see "savePaymentCardButton" exist on "myDetailsPage"

@manual @ECOMMUI-2
Scenario: My Account - validate user is  able to update existing beauty Card
  When I enter updated rewardsCard details
  And I enter updated billing address
  And I click on update payment details
  Then rewardsCard details should be updated


