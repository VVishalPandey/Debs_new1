Feature: Test Debenhams end to end journey number 5

@automatedSanity @preprodSanity @e2e
Scenario Outline: Sign into beauty club card section with user having linked card and validate if login and page after login is as expected
    Given I logout
    Given I navigate to "homeURL"
    Then I should see "logoDebenhams" exist on "commonPage"
    And I should see "searchIcon" exist on "commonPage"
    And I should see "savedItemsButton" exist on "commonPage"
    And I should see "myBagButton" exist on "commonPage"
    And I should see "personalFinanceLink" exist on "commonPage"
    And I should see "storeFinderLink" exist on "commonPage"
    And I should see "createAccountLink" exist on "commonPage"
    And I should see "myBeautyClubLink" exist on "commonPage"
    When I click on "myBeautyClubLink" on "commonPage"
    # Then I should see "headerTitleText" as "Join Beauty Club" on "beautyClubPage"
    # And I should see "headerSubTitleText" as "To join Beauty Club or to link your card to your account, please sign in or create a Debenhams.com account" on "beautyClubPage"
    # And I should see "tab1" as "Sign In" on "beautyClubPage"
    # And I should see "tab2" as "Create an account" on "beautyClubPage"
    # When I click on "tab1" on "beautyClubPage"
    And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
    And I enter "<password>" in "passwordField" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    And I wait for "7000" milliseconds
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "dashboardTab1" as "My rewards" on "beautyClubPage"
    And I should see "dashboardTab2" as "My Card" on "beautyClubPage"
    # And I should see "beautyPoints" exist on "beautyClubPage"
    And I should not see "noCardLinkedHeaderText" on "beautyClubPage"
    And I should not see "noCardLinkedText" on "beautyClubPage"
    And I should not see "linkCardButton" on "beautyClubPage"
    And I should see "manageAccountLink" exist on "beautyClubPage"
    When I click on "manageAccountLink" on "beautyClubPage"
    And I should see "beautyClubcardDashBoardLink" exist on "beautyClubPage"
    And I should see "myDetailsLink" exist on "beautyClubPage"
    And I should see "marketingPreferencesLink" exist on "beautyClubPage"
    And I should see "transactionHistorylink" exist on "beautyClubPage"
    And I should see "balancExpiryDatesLink" exist on "beautyClubPage"
    And I should see "reportLostCardLink" exist on "beautyClubPage"
    And I should see "removeCardLink" exist on "beautyClubPage"
    Examples:
        | email                      | password  | signedInHeaderTitle |
        | testautomationd3@gmail.com | password3 | Hello Test          |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate my details/removecard links under manage account in BeautyClub Card
    When I click on "myDetailsLink" on "beautyClubPage"
    Then I should see "headerText" as "My account" on "myDetailsPage"
    And I should not see "dashboardTab1" on "beautyClubPage"
    And I should not see "dashboardTab2" on "beautyClubPage"
    And I should not see "beautyPoints" on "beautyClubPage"
    And I should not see "beautyPoints" on "beautyClubPage"
    And I should see "beautyClubButton" exist on "myDetailsPage"
    When I click on "beautyClubButton" on "myDetailsPage"
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should not see "dateOfBirth" on "beautyClubPage"
    When I click on "manageAccountLink" on "beautyClubPage"
    And I click on "marketingPreferencesLink" on "beautyClubPage"
    Then I should see "headerText" as "My account" on "myDetailsPage"
    And I go back to previous page
    When I click on "manageAccountLink" on "beautyClubPage"
    And I click on "removeCardLink" on "beautyClubPage"
    And I should see "removeCardPopup" exist on "beautyClubPage"
    Then I should see "removedCardMessage" as "Are you sure you want to remove your Beauty Club card?" on "beautyClubPage"
    And I should see "removedCardWarning" as "<removedCardWarning>" on "beautyClubPage"
    And I should see "removeCardButton" exist on "beautyClubPage"
    And I should see "cancelButton" exist on "beautyClubPage"
    And I should see "closeButton" exist on "beautyClubPage"
    When I click on "cancelButton" on "beautyClubPage"
    And I should not see "removeCardPopup" on "beautyClubPage"
    Examples:
       | signedInHeaderTitle | removedCardWarning                                                                                                                         | pointsNotification                                           |
       | Hello Test          |  Removing your card from your Debenhams account will mean you can no longer view your collected points, balance or manage your card online. | Points from your transactions may take a few days to appear. |


@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate click on BalanceExpiry link in BeautyClub Card account
    When I click on "balancExpiryDatesLink" on "beautyClubPage"
    Then I should see "headerTitleText" as "My transaction history" on "beautyClubPage"
    And I should see "myTransactionHistory" as "My transaction history" on "beautyClubPage"
    And I should see "myBalanceExpiryDate" as "My balance expiry dates" on "beautyClubPage"
    And I should see "totalBalance" containing "Total balance:" on "beautyClubPage"
    Then I click on "myTransactionHistory" on "beautyClubPage"
    And I should see "backButton" exist on "beautyClubPage"
    And I should see "currentBalance" containing "Current Points Balance:" on "beautyClubPage"
    And I should see "pointsNotification" as "<pointsNotification>" on "beautyClubPage"
    And I should see "transactionDropdown" exist on "beautyClubPage"
    When I click on "backButton" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "dashboardTab1" as "My rewards" on "beautyClubPage"
    And I should see "dashboardTab2" as "My Card" on "beautyClubPage"
    Examples:
        | pointsNotification                                           |
        | Points from your transactions may take a few days to appear. |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate Transaction History link in BeautyClub Card account
    When I click on "manageAccountLink" on "beautyClubPage"
    Then I should see "dashboardTab1" as "My rewards" on "beautyClubPage"
    And I should see "dashboardTab2" as "My card" on "beautyClubPage"
    When I click on "transactionHistorylink" on "beautyClubPage"
    Then I should see "headerTitleText" as "My transaction history" on "beautyClubPage"
    And I should see "myTransactionHistory" as "My transaction history" on "beautyClubPage"
    And I should see "myBalanceExpiryDate" as "My balance expiry dates" on "beautyClubPage"
    And I should see "currentBalance" containing "Current Points Balance:" on "beautyClubPage"
    And I should see "pointsNotification" as "<pointsNotification>" on "beautyClubPage"
    And I should see "transactionDropdown" exist on "beautyClubPage"
    Then I click on "myBalanceExpiryDate" on "beautyClubPage"
    And I should see "backButton" exist on "beautyClubPage"
    And I should see "totalBalance" containing "Total balance:" on "beautyClubPage"
    When I click on "backButton" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "dashboardTab1" as "My rewards" on "beautyClubPage"
    And I should see "dashboardTab2" as "My card" on "beautyClubPage"
    Examples:
        | pointsNotification                                           |
        | Points from your transactions may take a few days to appear. |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate Report lost, stolen or damaged link in BeautyClub Card account
    When I click on "manageAccountLink" on "beautyClubPage"
    And I click on "reportLostCardLink" on "beautyClubPage"
    Then I should see "headerTitleText" as "Manage my card" on "beautyClubPage"
    And I should see "lostStolenTab" as "My card is lost, stolen or damaged" on "beautyClubPage"
    And I should see "leaveClubTab" as "I want to leave Beauty Club" on "beautyClubPage"
    Then I should see "cardCancelText" as "<cardCancelText>" on "beautyClubPage"
    And I should see "lostStolenTab" as "My card is lost, stolen or damaged" on "beautyClubPage"
    And I should see "notHavingCardLink" exist on "beautyClubPage"
    And I should see "beautyCardimage" exist on "beautyClubPage"
    And I click on "leaveClubTab" on "beautyClubPage"
    Then I should see "leaveBeautyClubText" containing "To leave Beauty Club, please " on "beautyClubPage"
    And I should see "leaveBeautyClubText" containing "with our customer services team who will be able to help." on "beautyClubPage"
    And I should see "leaveClubWarning" containing "<leaveClubWarning>" on "beautyClubPage"

    Examples:
        | cardCancelText                                    |leaveClubWarning|
        | Cancel my card and transfer balance to a new card |Leaving Beauty Club will cancel your card and make it unusable, remove it from your Debenhams Account and remove all points and rewards so they are no longer valid|


@automatedSanity @preprodSanity @e2e
Scenario Outline: Sign into beauty club card section with user having no linked card and validate if login and page after login is as expected
    Given I logout
    Given I navigate to "homeURL"
    Then I should see "logoDebenhams" exist on "commonPage"
    And I should see "searchIcon" exist on "commonPage"
    And I should see "savedItemsButton" exist on "commonPage"
    And I should see "myBagButton" exist on "commonPage"
    And I should see "personalFinanceLink" exist on "commonPage"
    And I should see "storeFinderLink" exist on "commonPage"
    And I should see "createAccountLink" exist on "commonPage"
    And I should see "myBeautyClubLink" exist on "commonPage"
    When I click on "myBeautyClubLink" on "commonPage"
    # Then I should see "headerTitleText" as "Join Beauty Club" on "beautyClubPage"
    # And I should see "headerSubTitleText" as "To join Beauty Club or to link your card to your account, please sign in or create a Debenhams.com account" on "beautyClubPage"
    # And I should see "tab1" as "Sign In" on "beautyClubPage"
    # And I should see "tab2" as "Create an account" on "beautyClubPage"
    # When I click on "tab1" on "beautyClubPage"
    And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
    And I enter "<password>" in "passwordField" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    And I wait for "7000" milliseconds
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
    And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
    And I should see "noCardLinkedHeaderText" as "DEBENHAMS BEAUTY CLUB" on "beautyClubPage"
    And I should see "noCardLinkedText" as "Beauty Club is closing. To find out how to redeem your existing rewards please visit our FAQs." on "beautyClubPage"
    # And I should see "linkCardButton" exist on "beautyClubPage"
    And I should not see "dashboardTab1" on "beautyClubPage"
    And I should not see "dashboardTab2" on "beautyClubPage"
    And I should not see "beautyPoints" on "beautyClubPage"
    And I should not see "passwordErrorMessage" on "beautyClubPage"
    And I should not see "beautyClubSetUpCardOptions" on "beautyClubPage"
    And I should not see "beautyClubSetUpCardDob" on "beautyClubPage"

    Examples:
        | email                      | password  | signedInHeaderTitle |
        | testautomationd7@gmail.com | password7 | Hello Test         |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the components and features of Beauty Landing Content Page
    When I click on "logoDebenhams" on "commonPage"
    When I "validate & click" subMenu option "Beauty Club card" under "Beauty" on commonPage bigscreen
    And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
    And I enter "<password>" in "passwordField" on "beautyClubPage"
    And I click on "signInButton" on "beautyClubPage"
    And I wait for "7000" milliseconds
    Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
    # Then I should see "beautyLandingHeroImage" exist on "beautyClubPage"
    # And I should see "beautyClbBannerRegisterBtn" exist on "beautyClubPage"
    # And I should see "beautyClbBannerSignInBtn" exist on "beautyClubPage"
    # And I should see "joinBeautyClubRegisterBtn" exist on "beautyClubPage"
    # And I should see "faqLink" exist on "beautyClubPage"
    # And I should see "beautyClubBenefitTab" exist on "beautyClubPage"
    # And I should see "beautyClbHowToJoinTab" exist on "beautyClubPage"
    # When I click on "beautyClbHowToJoinTab" on "beautyClubPage"
    # And I should see "howTojoinRegLink" exist on "beautyClubPage"
    # And I should see "howTojoinSignInLink" exist on "beautyClubPage"
   Examples:
    | email                      | password  | signedInHeaderTitle |
    | testautomationd7@gmail.com | password7 | Hello Test          |

@descoped @preprodSanity @e2e
Scenario: Validate sign in functionality from beauty landing content page if user is already signed in
    When I click on "beautyClbBannerSignInBtn" on "beautyClubPage"
    And I should not see "noCardLinkedHeaderText" on "beautyClubPage"
    And I should not see "noCardLinkedText" on "beautyClubPage"
    And I should not see "dashboardTab1" on "beautyClubPage"
    And I should not see "dashboardTab2" on "beautyClubPage"
    And I should not see "beautyPoints" on "beautyClubPage"
    And I should not see "passwordErrorMessage" on "beautyClubPage"
    And I should see "beautyClubSetUpCardOptions" exist on "beautyClubPage"
    And I should see "beautyClubSetUpCardDob" exist on "beautyClubPage"

@automatedSanity @preprodSanity @e2e
Scenario: Navigate to store finder page and validate the page
    Given I logout
    Given I navigate to "homeURL"
    And I should see "searchIcon" exist on "commonPage"
    And I should see "savedItemsButton" exist on "commonPage"
    And I should see "myBagButton" exist on "commonPage"
    And I should see "personalFinanceLink" exist on "commonPage"
    And I should see "storeFinderLink" exist on "commonPage"
    And I should see "createAccountLink" exist on "commonPage"
    And I should see "myBeautyClubLink" exist on "commonPage"
    When I click on "storeFinderLink" on "commonPage"
    Then I should see "url" contains "content/find-a-store"
    And I should see "headerText" as "Store Finder" on "storeFinderPage"
    And I should see "storeFinderField" exist on "storeFinderPage"
    And I should see "storeFinderButton" exist on "storeFinderPage"
    And I should not see "mapImage" on "storeFinderPage"

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the store finder result (maximum 5 value) when user enters correct input
    When I enter "<storeFinderName>" in "storeFinderField" on "storeFinderPage"
    And I click on "storeFinderButton" on "storeFinderPage"
    Then I should see "storeFinderEnteredText" as "<storeFinderName>" on "storeFinderPage"
    And I count number of "searchedStoreInfoElements" to be "<max_count>" on "storeFinderPage"
    And I should see "mapImage" exist on "storeFinderPage"

Examples:
    | storeFinderName | max_count |
    | E16FQ           | 5         |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the first store locator details in result area
    Then I should see "firstStoreDetails" as "<firstStoreName>" on "storeFinderPage"
    When I click on "firstStoreDetails" on "storeFinderPage"
    Then I should see "storeDetailName" as "<firstStoreName>" on "storeFinderPage"
    And I should see "headerText" as "Store Finder" on "storeFinderPage"
    And I should see "mapImage" exist on "storeFinderPage"

Examples:
    | firstStoreName         |
    | London - Oxford Street |

@automatedSanity @preprodSanity @e2e
Scenario Outline: Validate the Query parameter urls are working fine
  Then I navigate to "<testQueryURL>"
  Then I should see "sizeGuideLink" exist on "pdpPage"
  And I should see "deliveryReturnText" as "Delivery & Returns" on "pdpPage"
  Then I add the product to bag and go to my bag page

  Examples:
    | testQueryURL  |
    | testQueryURL1 |
    | testQueryURL2 |

@automatedSanity @e2e
Scenario: Validate the Men Brand A-Z is scrolled to the selected brand U
  Given I logout
  When I "validate & click" subMenu option "Brands A-Z" under "Men" on commonPage bigscreen
  Then I "validate & click" brand option "U" on commonPage bigscreen
  Then I click on "(UN)BIAS" on brand AtoZ page
  And I should see "pspHeader" as "(UN)BIAS" on "pspPage"

@automatedSanity @e2e
Scenario: Validate the Sale TCAT page
  Given I logout
  When I "validate & click" menu option "Offers" on commonPage bigscreen
  Then I should see "heroBanner" exist on "pspPage"
  When I "validate" subFilter option "Women" under "Categories" on commonPage bigscreen
  Then I should see "saleText" as "SALE" on "pspPage"
  When I click on "adspot" on "pspPage"
  Then I should see "breadcrumbSection" exist on "pspPage"
  And I should see "sortDropdown" exist on "pspPage"
  And I should see "filterSection" exist on "pspPage"

@automatedSanity @e2e
Scenario: Validate the Men Brand A-Z is scrolled to the selected brand U
  Given I navigate to "styleDebriefUrl"
  Then I should see "styleDebriefHeader" containing "Stay in the know with all things fashion and lifestyle." on "pspPage"
  Then I should see "styleDebriefFilter" exist on "pspPage"
  Then I should see "styleDebriefAdspotText" containing "Dress for spring" on "pspPage"
  When I click on "styleDebriefAdspotLink" on "pspPage"
  Then I should see "articleHead" exist on "pspPage"
  Then I should see "header2" as "Dress for spring" on "pspPage"
  When I click on "articleHeadPlpLink" on "pspPage"
  And I should see "url" contains "/plp/"

@automatedSanity @DEBD-4096
Scenario: Validate Partial Login Journey with same user and guest user
    Given I logout
    When I am on my details page
    And I "Remove" "all" products from "myBagPage"
    And I "Remove" "all" products from "mySavedItems"
    Then I navigate to "testDressPdpURL"
    And I should see "saveForLaterButton" exist on "pdpPage"
    And I click on "saveForLaterButton" on "pdpPage"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I set mvt test for "partialContAsGuest" as "variation1"
    When I redirect user to partial login page
    And I login back through the partial login screen with the "sameUser"
    And I should see "minibagCount" containing "1" on "minibagPage"
    And I should see "savedItemCount" containing "1" on "mySavedItemPage"
    And I set mvt test for "partialContAsGuest" as "variation1"
    When I redirect user to partial login page
    And I login back through the partial login screen with the "guestUser"
    When I click on "logoDebenhamsDeliveryPage" on "deliveryOptionPage"
    And I should see "minibagCount" containing "1" on "minibagPage"
    And I should see "savedItemCount" containing "0" on "mySavedItemPage"
