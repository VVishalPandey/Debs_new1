Feature: Test Debenhams Partial Login functionality


@manual @DEBD-484
Scenario: Validation of the  Welcome Page when the user is partially logged out
  Given the user is logged in
  And the user adds the products
  And navigates to the basket page
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the Email address field on the page should not be prepopulated
  And I should see the greeted by name
  And the THE MESSAGE on the screen should read, Welcome Back Please re-enter your email address and password to continue.
  And I should see  email and password field
  And I should see  Forgotten your password link
  And I should see the Sign in CTA


@manual @DEBD-484
Scenario Outline: Validation of the login from Welcome page via Partial login
  Given the user is logged in
  And the user adds the products
  And navigates to the basket page
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "My Account" exist on "myAccount"

  Examples:
    | email           | password |
    | user1@gmail.com | pass1    |


@manual @DEBD-484
Scenario: Validation of the prefilled email and password in the Welcome Page
  Given the user is logged in and credeitials are saved in browser
  And the user adds the products
  And navigates to the basket page
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And the Email address & Password field on the page should  be prepopulated
  And I should see the greeted by name
  And the THE MESSAGE on the screen should read, Welcome Back Please re-enter your email address and password to continue

@manual @DEBD-484
Scenario: Validation of the header and not you functionality for partial login user
  Given the user is logged in
  When the user is inactive for 30min
  Then the user should be taken back to the "Welcome Back" page
  And I should see the "Hello, username, (not you?)" on common page
  And I click on "Notyou" on "commonPage"
  And I should see "MyAccount" exist on "loginPage"
  And I should see "SignIn"  exist on "commonPage"

@manual @DEBD-484
Scenario: Validation of the session not getting timed out for  less than 30 minutes
  Given the user is not logged in
  And the user adds the products to the basket page
  When the user is inactive for 20 min
  Then the user should not be session timed out
  And should not see the "Welcome Back" page

#  Below scenarios has been documented when the monetate key is set as ON to enable the new partial login functionality

# 1.Partial Login display=======>
@automated @DEBD-4096
Scenario: Validate the display of partial login  screen when user is redirected by clicking Secure checkout button in MyBag
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
    And I should see "partialLoginHeader" exist on "loginPage"
    And I should see "partialLoginWelcomeMessage" as "Please re-enter your email and password to continue" on "loginPage"
    And I should see "emailAddressFieldSignIn" exist on "loginPage"
    And I should see "passwordFieldType" exist on "loginPage"
    And I should see "showHideButton" exist on "loginPage"
    And I should see "forgotPasswordLink" exist on "loginPage"
    And I should see "signInButton" exist on "loginPage"
    And I should see "partialLoginContGuestBtn" exist on "loginPage"

@notAutomated @DEBD-4096
Scenario: Validate Forgot Password link functionality in Partial Login Page
    And I should see "forgotPasswordLink" exist on "loginPage"
    And I click on "forgotPasswordLink" on "loginPage"
    And I should redirect to Forgotten your password page
    And I enter my email address
    And I reset the password with the Link in another browser
    And I am able to login back from partial login page using the new password

@manual @DEBD-4096
Scenario: Validate country selector behavior on partail login page
    When I redirect user to partial login page
    Then I "validate & click" country as "IE" from "countryOptions" on "commonPage"
    And I logged in with same credentials of UK through which user has redirected to Partial Login
    And I should add the products to Bag
    Then I "validate & click" country as "UK" from "countryOptions" on "commonPage"
    And I click on "createAccountSIgnIn" on "commonPage"
    And I should see the partial login page
    And I login back through the partial login screen with the same user
    And I should not see the IE user details in UK


# 2.Login from Partial Login screen:=======>

@automated @DEBD-4096
Scenario: Validate the functionality if same user signs in and my bag items and saved items count should remain as is
   And I login back through the partial login screen with the "sameUser"
   And I should see "minibagCount" containing "1" on "minibagPage"
   And I should see "savedItemCount" containing "1" on "mySavedItemPage"

@automated @DEBD-4096
Scenario: Navigate to partial login page and sign in with different user credenitails and validate user should redirect to My Account Page
    Then I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I set mvt test for "partialContAsGuest" as "variation1"
    When I redirect user to partial login page
    And I login back through the partial login screen with the "differentUser"

@manual @DEBD-4096
Scenario: Validate the user redirects to delivery page when sign in from partial login screen
   And I validate that saved adress for the user should be displayed in delivery checkout page

@notAutomated @DEBD-4096
Scenario: Validate the error message scenarios and empty field scenarios on Partial login screen
  When I navigate to "homeUrl"
  When I click on "checkoutButton" on "myBagPage"
  When I redirect user to partial login page
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"
  And I enter "user1" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "loginPage"
  And I enter "user1@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"
  And I enter "user1@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "pass1" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

@notAutomated @DEBD-4096
Scenario: Navigate to partial login page and validate show hide functiality for password
  And I enter "password2" in "passwordField" on "registerPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"



@manual @DEBD-4096
Scenario: sign in with different user credenitails and validate user details for first user should not display in second user
    And I should not see the address for first user
    And I go to bag and should not see the bag details for first user

@manual @DEBD-4096
Scenario Outline: Navigate to partial login page from delivery Page options and continue the journey as signed in/guest/new user
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I am on delivery page
    And I have keep the session idle for more than 30 minutes
    And I click on "<options>" on "deliveryPage"
    When I redirect user to partial login page
    And I should see "partialLoginContinueGuesBtn" exist on "loginPage"
    And I validate the journey as signedin / newuser and guest customer

    Examples:
        | options |
        | homedeliveryOption |
        | clickCollectOption |
        | useThisAddressButton |
        | useThisAddressButton |
        | addNewAddressOption |
        | standardOption |
        | nextNominatedSectionHeader |
        | proceedPaymentButton |


@manual @DEBD-4096
Scenario: Navigate to partial login page from orderConfirmation Page options and continue the journey as signed in/guest/new user
    When I am on order confirmation page
    And I have keep the session idle for more than 30 minutes
    And I click on "continueShoppingButton" on "orderconfpage"
    When I redirect user to partial login page
    And I validate the journey as signedin / newuser and guest customer


# 3.Contiue as guest from Partial Login screen::=======>
@automated @DEBD-4096
Scenario: Validate Continue as Guest button on Partial Login Page should redirect user to Guest Partial Login Screen and validate the components
    Given I logout
    And I am on my details page
    Then I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I set mvt test for "partialContAsGuest" as "variation1"
    When I redirect user to partial login page
    And I click on "partialLoginContGuestBtn" on "loginPage"
    Then I should see "partialLoginGuestForm" exist on "loginPage"
    Then I should see "partialLoginGuestTitle" as "Continue as guest" on "loginPage"
    Then I should see "partialLoginGuestEmailConfCopy" as "We'll use this email to confirm your order" on "loginPage"

@automated @DEBD-4096
Scenario: Validate error email validation in continue as guest partial login screen
  And I clear "partialLoginGuestEmailInput" on "loginPage"
  And I enter "user2" in "partialLoginGuestEmailInput" on "loginPage"
  And I click on "partialLoginGuestEmailConfCopy" on "loginPage"
  Then I should see "partialLoginGuestEmailError" as "Enter a valid email address" on "loginPage"
  And I clear "partialLoginGuestEmailInput" on "loginPage"
  And I click on "partialLoginGuestEmailConfCopy" on "loginPage"
  Then I should see "partialLoginGuestEmailError" as "The email address field cannot be empty" on "loginPage"

@notAutomated @DEBD-4096 @descoped
Scenario: Validate back link functionality in continue as guest partial login screen
  When I click on "partialLoginGuestBackLink" on "loginPage"
  And I should see "partialLoginWelcomeMessage" as "Please re-enter your email and password to continue" on "loginPage"
  And I click on "partialLoginContGuestBtn" on "loginPage"
  Then I should see "partialLoginGuestBackLink" exist on "loginPage"

@automated @DEBD-4096 @tbd
Scenario: Validate close button functionality in continue as guest partial login screen
  When I click on "closeIcon" on "loginPage"
  And I should see "partialLoginWelcomeMessage" as "Please re-enter your email and password to continue" on "loginPage"
  And I click on "partialLoginContGuestBtn" on "loginPage"
  Then I should see "closeIcon" exist on "loginPage"

@automated @DEBD-4096
Scenario: Validate enter as a guest user functionality
  And I click on "partialLoginContGuestBtn" on "loginPage"
  And I enter "user222222@gmail.com" in "partialLoginGuestEmailInput" on "loginPage"
  And I click on "partialLoginGuestContinueBtn" on "loginPage"
  And I should see "deliveryOptionheaderText" exist on "deliveryOptionPage"

@notAutomated @DEBD-4096 @tbd
Scenario: Validate Back Link functionality in Secure Checkout Pop up
  When I click on "partialLoginContGuestBtn" on "loginPage"
  When I click on "secureCheckoutPopUp" on "deliverOptionsPage"
  And I should see "partial login" exist on "deliverOptionsPage"

@notAutomated @DEBD-4096 @tbd
Scenario: Validate Browser Back functionality in Secure Checkout Pop up
  When I go back to previous page
  And I should see "partial login" exist on "deliverOptionsPage"

@automated @DEBD-4096
Scenario: Validate user should be redirected to delivery page as Conitue as Guest user
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
    And I login back through the partial login screen with the "guestUser"

@automated @DEBD-4096
Scenario: Validate the functionality for guest user where saved item count should be zero and my bag count shoul remain as is
    When I click on "logoDebenhamsDeliveryPage" on "deliveryOptionPage"
   And I should see "minibagCount" containing "1" on "minibagPage"
   And I should see "savedItemCount" containing "0" on "mySavedItemPage"

# 3.Navigating back in the journey after 'Continuing as a guest'=======>

@notAutomated @DEBD-4096
Scenario: Validate navigate back functionality from delivery page using my bag link
  And I click on "myBagLink" on "deliveryOptionsPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I click on "secureCheckoutButton" on "myBagPage"
  And I should not see "secureCheckoutPopUp" on "deliveryOptionsPage"
  And I should not see "ghostScreen" on "deliveryOptionsPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I should not see "savedAddress" on "deliveryOptionPage"

@notAutomated @DEBD-4096
Scenario: Validate navigate back functionality from delivery page using my bag link and sign in from (Header)
  And I click on "myBagLink" on "deliveryOptionsPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  And I enter "testukpp1@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "password2" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I click on "myBagButton" on "commonPage"
  When I click on "secureCheckoutButton" on "myBagPage"
  And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
  And I should see "clickCollectOption" exist on "deliveryOptionPage"
  When I click on "homeDeliveryOption" on "deliveryOptionPage"
  And I should see "savedAddress" exist on "deliveryOptionPage"


# 3.Partial login behaviour for different bag states:=======>

@notAutomated @DEBD-4096
Scenario: Validate the applied promocode should be reduild when user logged in back with same credentials through partial login screen
    Given I logout
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    And I apply the promocode
    Then I should see "headerText" as "My Bag" on "myBagPage"
    When I redirect user to partial login page
    And I login back through the partial login screen with the same user
    And I click on "myBagLink" on "deliveryPage"
    And I validate applied promocode should still exists

@notAutomated @DEBD-4096
Scenario: Validate free gift product in the bag should be reduild when user logged in back with same credentials through partial login screen
    Then I navigate to "freeGiftPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    When I redirect user to partial login page
    And I login back through the partial login screen with the same user
    And I click on "myBagLink" on "deliveryPage"
    And I should see "freeGiftProductName" product name exist on myBagPage

# 4.Partial login error scenario:=======>

@notAutomated @DEBD-4096 @tbd
Scenario: Validate partial login error scenario in case of network error and product going OOS
    Given I logout
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    When I redirect user to partial login page
    When I click on "partialLoginContGuestBtn" on "loginPage"
    And we are unable to re-build the customers Bag completely because of a network error or a product going out of stock
    Then I will see an error displayed in a toast notification at the top of the page
    And after X seconds I will be taken to the My Bag page (NOTE: ** timing to be decied during implementation as part of visual QA)
    And the remaining items will be shown in my Bag.

@notAutomated @DEBD-4096
Scenario: Continue the journey from My Bag for Partial Login error scenario and validate secure checkout pop functionality
    And I click on "secureCheckoutButton" on "myBagPage"
    And I should see "secureCheckoutPopUp" exist on "deliveryOptionsPage"
    Then I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
    And I should see "bagLoginOverlay" exist on "loginPage"
    And I should see "bagLoginOverlayHeader" exist on "loginPage"
    And I should see "continueAsGuestOption" exist on "loginPage"
    And I should see "signInAsOption" exist on "loginPage"
    And I should see "cancelButton" exist on "loginPage"
    When I click on "continueAsGuestText" on "loginPage"
    And I enter "dhjdhd@djdhd.com" in "emailaddreField" on "loginPage"
    And I click on "continueButton" on "loginPage"
    And I should not see "ghostScreen" on "deliveryOptionsPage"
    And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
    And I should see "clickCollectOption" exist on "deliveryOptionPage"
    When I click on "homeDeliveryOption" on "deliveryOptionPage"
    And I should not see "savedAddress" on "deliveryOptionPage"

# 5.My Bag - regression:=======>

@notAutomated @DEBD-4096
Scenario: Validate that secure checkout journey should remain as it is for guest user
    Given I logout
    When I am on my details page
    Given I logout
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    And I should see "bagLoginOverlay" exist on "loginPage"
    And I should see "bagLoginOverlayHeader" exist on "loginPage"
    And I should see "continueAsGuestOption" exist on "loginPage"
    And I should see "signInAsOption" exist on "loginPage"
    And I should see "cancelButton" exist on "loginPage"
    When I click on "continueAsGuestText" on "loginPage"
    And I enter "dhjdhd@djdhd.com" in "emailaddreField" on "loginPage"
    And I click on "continueButton" on "loginPage"
    And I should not see "ghostScreen" on "deliveryOptionsPage"
    And I should see "homeDeliveryOption" exist on "deliveryOptionPage"
    And I should see "clickCollectOption" exist on "deliveryOptionPage"
    When I click on "homeDeliveryOption" on "deliveryOptionPage"
    And I should not see "savedAddress" on "deliveryOptionPage"

#  Below scenarios has been documented when the monetate key is set as OFF
# 6.Delivery page & Payment page partial login (AS IS)**=======>

@notAutomated @DEBD-4096
Scenario: Validate delivery checkout journey for sign in user should behave as it is after partial login
    Given I logout
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    When I redirect user to partial login page
    And I should not see "partialLoginContinueGuesBtn" on "loginPage"
    And I enter "testukpp1@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    And I enter "password2" in "passwordField" on "loginPage"
    And I click on "signInButton" on "loginPage"
    Then I should see "deliveryOptionheaderText" as "How would you like to receive your order?" on "deliveryOptionPage"
    And I should see "homeDeliveryHeaderText" as "Home Delivery" on "deliveryOptionPage"
    And I should see "clickCollectHeaderText" as "Click & Collect" on "deliveryOptionPage"
    When I click on "homeDeliveryOption" on "deliveryOptionPage"
    And I am in view of "deliveryAddressheaderText" on "homeDeliveryPage"
    Then I should see "deliveryAddressheaderText" as "Where are we delivering to?" on "homeDeliveryPage"
    And I click on "useThisAddressButton" on "homeDeliveryPage"
    Then I should see "deliveryTypeheaderText" as "Choose your delivery option" on "deliveryOptionPage"
    When I am in view of "deliveryTypeheaderText" on "deliveryOptionPage"
    And I click on "standardOption" on "deliveryOptionPage"
    Then I should not see "nextNominatedSectionHeaderText" on "deliveryOptionPage"
    And I should not see "daytimeTab" on "deliveryOptionPage"
    And I should not see "eveningTab" on "deliveryOptionPage"
    Then I should see "deliveryMessage" containing "Your order will arrive within five working days" on "deliveryOptionPage"
    And I should see "proceedPaymentButton" exist on "deliveryOptionPage"
    When I click on "proceedPaymentButton" on "deliveryOptionPage"
    Then I should see "headerText" as "Your order" on "paymentPage"
    And I should see "promoCodeAccordion" as "Do you have a promotional code?" on "paymentPage"
    And I should see "giftCardAccordion" as "Pay with a Gift card" on "paymentPage"
    And I should see "creditCardAccordion" as "Pay with a Credit, Debit or Store card" on "paymentPage"
    And I should see "placeOrderButton" exist on "paymentPage"
    And I validate "credit card points" value from mybag
    And I should see "deliveryType" as "Standard Delivery" on "paymentPage"

@notAutomated @DEBD-4096
Scenario: Navigate to partial login page and sign in with different user credenitails and validate user details for first user should not display in second user
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    When I redirect user to partial login page
    And I should not see "partialLoginContinueGuesBtn" on "loginPage"
    And I enter "testukpp1@gmail.com" in "emailAddressFieldSignIn" on "loginPage"
    And I enter "password2" in "passwordField" on "loginPage"
    And I should be redirected to My Account Page
    And I should not see the address for first user
    And I go to bag and should not see the bag details for first user


@manual @DEBD-4096
Scenario Outline: Navigate to partial login page from delivery Page options and continue the journey as signed in/new user
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I am on delivery page
    And I have keep the session idle for more than 30 minutes
    And I click on "<options>" on "deliveryPage"
    And I should see the partial login page
    And I should not see "partialLoginContGuestBtn" on "loginPage"
    And I validate the journey as signedin / newuser

    Examples:
        | options |
        | homedeliveryOption |
        | clickCollectOption |
        | useThisAddressButton |
        | useThisAddressButton |
        | addNewAddressOption |
        | standardOption |
        | nextNominatedSectionHeader |
        | proceedPaymentButton |

@manual @DEBD-4096
Scenario Outline: Navigate to partial login page from payment Page options and continue the journey as signed in/new user
    When I am on my details page
    Then I navigate to "testDressPdpUrl"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I am on delivery page
    And I click on proceedPaymentButton
    And I am on payment page
    And I have keep the session idle for more than 30 minutes
    And I click on "<options>" on "deliveryPage"
    And I should see the partial login page
    And I should not see "partialLoginContGuestBtn" on "loginPage"
    And I validate the journey as signedin / newuser

    Examples:
        | options |
        | changedDelMethodLink |
        | editShoppingBagLink |
        | placeOrderButton |

@manual @DEBD-4096
Scenario: Navigate to partial login page from orderConfirmation Page options and continue the journey as signed in/new user
    When I am on order confirmation page
    And I have keep the session idle for more than 30 minutes
    And I click on "continueShoppingButton" on "orderconfpage"
    When I redirect user to partial login page
    And I should not see "partialLoginContGuestBtn" on "loginPage"
    And I validate the journey as signedin / newuser



# 7.My Account/Beauty Club partial login (AS IS)=======>

@automated @DEBD-4096
Scenario: Navigate to partial login page through My Account/My Beauty link and validate continue as guest button should not be visible
    Given I logout
    When I am on my details page
    Then I navigate to "testDressPdpURL"
    And I select available size and add to bag on pdpPage
    And I click on "viewBasketCheckoutButton" on "pdpPage"
    Then I should see "headerText" as "My Bag" on "myBagPage"
    And I set mvt test for "partialContAsGuest" as "variation1"
    When I redirect user to partial login page
    Then I click on "logoDebenhams" on "commonPage"
    Then I click on "createAccountLink" on "commonPage"
    And I wait for "3000" milliseconds
    Then I should not see "partialLoginContGuestBtn" on "loginPage"
    Then I click on "myBeautyClubLink" on "commonPage"
    And I wait for "3000" milliseconds
    Then I should not see "partialLoginContGuestBtn" on "loginPage"


@manual @DEBD-4096
Scenario Outline: Navigate to partial login page through My Account link and validate user journey should behave as is
    Given I logout
    When I am on my details page
    Then I navigate to "<page>"
    And my session has been idle for more than 30 minutes
    And I click on "myAccountLInk" on "commonPage"
    And I should see the partial login page
    And I should not see "partialLoginContGuestBtn" on "loginPage"
    And I logged in back and navigate to the payment page
    And I validate bag items and user details should remian as is.

Examples:
    | page |
    | testDressPspUrl  |
    | testDressPdpUrl  |
    | plpPage  |
    | TCAT page  |
    | SCAT page  |
    | Content Page  |
    | My Saved Items page  |
    | Home page  |

@manual @DEBD-4096
Scenario Outline: Navigate to partial login page through My Beauty link and validate user journey should behave as is
    Given I logout
    When I am on my details page
    Then I navigate to "<page>"
    And my session has been idle for more than 30 minutes
    And I click on "myBeautyLink" on "commonPage"
    And I should see the partial login page
    And I should not see "partialLoginContGuestBtn" on "loginPage"
    And I logged in back and navigate to the payment page
    And I validate bag items and user details should remian as is.

Examples:
    | page |
    | testDressPspUrl  |
    | testDressPdpUrl  |
    | plpPage  |
    | TCAT page  |
    | SCAT page  |
    | Content Page  |
    | My Saved Items page  |
    | MHome page  |
