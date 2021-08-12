Feature: Test Debenhams basket checkout page

@manual @DBNHST-1578 @DEBD-2562
Scenario Outline: Validate the checkout Sign in Page for Registered User
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  Then I should scroll to "checkoutButton" on "myBagPage"
  And I click on "checkoutButton" on "myBagPage"
  And I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
  And I should see "returningCustomerLogin" exist on "basketCheckoutPage"
  And I should see "returningCustomerLoginText" as "quicker Checkout" on "basketCheckoutPage"
  And I should see "guestLogin" exist on "basketCheckoutPage"
  And I should see "guestLoginText" as "No Registration required" on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerLogin" below "guestLoginText" on "basketCheckoutPage"
  When I click on "returningCustomerLogin" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

  Examples:
   | email                      | password  |
   | testautomationd2@gmail.com | password2 |



@manual @DBNHST-1578 @DEBD-2562
Scenario Outline: Validate the checkout Sign in Page for guest User
  Given I logout
  And I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  Then I should scroll to "checkoutButton" on "myBagPage"
  And I click on "checkoutButton" on "myBagPage"
  And I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
  And I should see "returningCustomerLogin" exist on "basketCheckoutPage"
  And I should see "returningCustomerLoginText" as "A quicker Checkout using my saved credentials" on "basketCheckoutPage"
  And I should see "guestLogin" exist on "basketCheckoutPage"
  And I should not see "guestLoginText" on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerLogin" above "guestLoginText" on "basketCheckoutPage"
  When I click on "guestLogin" on "basketCheckoutPage"
  And I should see "guestHeaderText" as "Continue as guest" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  Then I click on "continueAsGuestButton" on "basketCheckoutPage"
  And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

  Examples:
   | email                      |
   | testautomationdnew2@gmail.com |

@manual @DBNHST-2011 @DEBD-2562
Scenario Outline: Validate the checkout Sign in Page for Ghost User
  Given I logout
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  Then I should scroll to "checkoutButton" on "myBagPage"
  And I click on "checkoutButton" on "myBagPage"
  And I should see "checkoutHeader" as "Secure Checkout" on "basketCheckoutPage"
  And I should see "returningCustomerLogin" exist on "basketCheckoutPage"
  And I should see "returningCustomerLoginText" as "A quicker Checkout using my saved credentials" on "basketCheckoutPage"
  And I should see "guestLogin" exist on "basketCheckoutPage"
  And I should not see "NoRegistrationRequiredText" on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerLogin" above "guestLoginText" on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  When I click on "guestLogin" on "basketCheckoutPage"
  And I should see "guestHeaderText" as "Continue as guest" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "errorTextMessage" as "We've found an account related to this email address" on "basketCheckoutPage"
  Then I click on "closeButton" on "basketCheckoutPage"
  And I should see "guestLoginContinueButton" exist on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  Then I click on "guestLoginContinueButton" on "basketCheckoutPage"
  And I should see "checkoutHeader" as "You have an account" on "basketCheckoutPage"
  And I should see "goToAccountText" as "Go to your account" on "basketCheckoutPage"
  And I should see "quickerSignText" as "Sign in for a quicker checkout" on "basketCheckoutPage"
  And I should see "emailAddressGhost" as "<email>" on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "ghostSignInButton" exist on "basketCheckoutPage"
  And I should see "continueAsGuestButton" exist on "basketCheckoutPage"
  Then I click on "continueAsGuestButton" on "basketCheckoutPage"
  And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBNHST-1560
Scenario: Navigate to My bag page then click on checkout button and validate that the login page opens as a popout window.

@manual @DBNHST-1852
Scenario: Validation of the Welcome Landing Page Drawer when user clicks on the checkout on the my bag
  Given the user is logged in as guest user
  And the user is on the PDP page
  When the user adds the products on the bag
  And the user proceeds with the checkout flow
  Then the user should view the drawer on the welcome landing page
  And the user should view the following fields

  |Fields            | Type|
  |Secure Checkout   | Label|
  |Close             | CTA|
  |continue as guest | CTA|
  |Sign In           | CTA|
  |A quicker Checkout using my saved credentials| Label|



@manual @DBNHST-1852
Scenario: Validation of the Close CTA on the Welcome Landing Page Drawer
  Given the user is on the Welcome Landing Page
  When the user clicks on the close button
  Then the Drawer should get close
  And user should return to the My Bag Page


@manual @DBNHST-1966 @DEBD-2562
Scenario: Validation of the Guest User Page when clicks on the Guest User on the Welcome Landing Page Drawer
  Given the user is logged in as guest user
  And the user is on the PDP page
  When the user adds the products on the bag
  And the user proceeds with the checkout flow
  Then the user should view the welcome landing page drawer
  And user clicks on the Continue as Guest on welcome landing page drawer
  And the user should view the Guest Page with following fields

  |Fields            | Type|
  |Secure Checkout   | Label|
  |Close             | CTA|
  |Back              | CTA|
  |Continue as Guest | Label|
  |Email             | Input field|
  |we'll use this email to confirm your order copy    | Text|
  |Continue          | CTA|


@manual @DBNHST-1966 @DEBD-2562
Scenario: Validation of the Successful Guest user logged in on the Continue as Guest user
  Given the user is logged in as guest user
  And the user is on Welcome Page
  And the user click on the continue as Guest
  And Guest Page will be displayed
  When user enters the Valid Email Address
  And clicks on the Continue
  Then the Drawer should get close
  And user should proceed to Delivery Page

@manual @DBNHST-1966 @DEBD-2562
Scenario: Validation of the error message for the invalid email address on the Guest page
  Given the user is logged in as guest user
  And the user is on Welcome Page
  And the user clicks on the continue as Guest
  And Guest Page will be displayed
  When user enters the in-valid email address
  And clicks on the Continue
  Then the user should see the Inline error message
  And relevant field in a red border

@manual @DBNHST-1966 @DEBD-2562
Scenario: Validation of the Back CTA on the Guest Page
  Given the user is logged in as guest user
  And the user is on Continue as Guest Page
  When the user clicks on the Back CTA on the page
  Then the user should be taken back to the Welcome Landing Page

@manual @DBNHST-1966 @DEBD-2562
Scenario: Validation of the Close CTA on the Guest Page
  Given the user is logged in as guest user
  And the user is on Continue as Guest Page
  When the user clicks on the Close CTA on the page
  Then the drawer should close
  And should return to the My Bag Page

@manual @DBNHST-1967 @DEBD-2562
Scenario: Validation of the Sign In Page when clicks on the Sign in on the Welcome Landing Page Drawer
  Given the user is logged in as guest user
  And the user is on the PDP page
  When the user adds the products on the bag
  And the user proceeds with the checkout flow
  Then the user should view the welcome landing page drawer
  And user clicks on the Sign in on welcome landing page drawer
  And the user should view the Sign in Page with following fields

  |Fields            | Type|
  |Secure Checkout   | Label|
  |Close             | CTA|
  |Back              | CTA|
  |Email Address     | Input field|
  |Password          | Input field|
  |ForgotPassword    | Link|
  |Sign In           | CTA|


@manual @DBNHST-1967 @DEBD-2562
Scenario: Validation of the Successful Sign-in on the Sign Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user enters the valid Email address
  And enters the Password
  And clicks on the Sign in Button
  Then the Drawer should get close
  And user should be successfully signed in
  And user should proceed to Delivery Page

@manual @DBNHST-1967 @DEBD-2562
Scenario: Validation of the Error message on the unsuccessful Sign-in on the Sign Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user enters the In-valid Email address
  And enters the Invalid Password
  And clicks on the Sign in Button
  Then the user should see the inline error message
  And relevant field in a red border

@manual @DBNHST-1967 @DEBD-2562
Scenario: Validation of the account lock Error message on the unsuccessful Sign-in on the Sign in Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user enters the valid email address
  And user enters the incorrect password
  And clicks on the Sign in continuously for 3 times
  Then the user should see the account lock error message with ResetPassword Link
  And clicking on the link should navigate to the account reset page

@manual @DBNHST-1967
Scenario: Validation of the Back CTA on the Sign Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user clicks on the Back CTA on the page
  Then the user should be taken back to the Welcome Landing Page

@manual @DBNHST-1967
Scenario: Validation of the Close CTA on the Sign Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user clicks on the Close CTA on the page
  Then the drawer should close
  And should return to the My Bag Page

@manual @DBNHST-1967
Scenario: Validation of the Forgot Password on the Sign Page
  Given the user is logged in as guest user
  And the user is on Sign in Page
  When the user clicks on the Forgot Password
  Then the drawer should close
  And user should be directed to forgotton password page


@manual @DBNHST-1968 @DEBD-2562
Scenario: Validation of the Ghost Page when user enters the registered email address on the Continue as Guest page
  Given the user is on welcome landing page drawer
  And the user click on the continue as Guest
  And Guest Page will be displayed
  When user enters the registered Email address on the Continue as Guest page
  And clicks on the Continue
  Then the user should view the Ghost Page with following fields

  |Fields              | Type|
  |you have an account | Label|
  |Hello Header        | Label|
  |Close               | CTA|
  |We have noticed     | Copy|
  |Go to the Account   |  Container|
  |Email Address       | Input field as populated|
  |Password            | Input field|
  |ResetPassword       | Link|
  |Sign In             | Copy|
  |Sign In             | CTA|
  |or                  | Copy|
  |Continue as guest   | CTA|


@manual @DBNHST-1968 @DEBD-2562
Scenario: Validation of the Successful Sign-in on the Ghost Page
  Given the user is on the Ghost Page
  When the user enters the valid password
  And clicks on the Sign in
  Then the Drawer should get close
  And user should be successfully signed in
  And user should proceed to Delivery Page

@manual @DBNHST-1968 @DEBD-2562
Scenario: Validation of the Error message on the unsuccessful Sign-in on the Ghost Page
  Given the user is on the Ghost Page
  When the user enters the in-valid password
  And clicks on the Sign in
  Then the user should see the inline error message
  And relevant field in a red border

@manual @DBNHST-1968
Scenario: Validation of the account lock Error message on the unsuccessful Sign-in on the Ghost Page
  Given the user is on the Ghost Page
  When the user enters the valid email address
  And user enters the incorrect password
  And clicks on the Sign in continuously for 3 times
  Then the user should see the account lock error message with ResetPassword Link
  And clicking on the link should navigate to the account reset page


@manual @DBNHST-1968 @DEBD-2562
Scenario: Validation of the Guest login on the Ghost Page
  Given the user is on the Ghost Page
  When the user clicks on the Continue as guest
  Then the Drawer should get close
  And user should proceed to Delivery Page
  And user should not be signed in

@manual @DBNHST-1968
Scenario: Validation of the Guest login on the Ghost Page for the valid password
  Given the user is on the Ghost Page
  When the user enters the valid password
  And the user clicks on the Continue as guest
  Then the Drawer should get close
  And user should proceed to Delivery Page
  And user should not be signed in

@manual @DBNHST-1968
Scenario: Validation of the Reset Password on the Ghost Page
  Given the user is on the Ghost Page
  When the user clicks on the reset Password
  Then the Drawer should get close
  And user should proceed to reset password page


@manual @DBNHST-1968
Scenario: Validation of the Close CTA on the Ghost Page
  Given the user is on the Ghost Page
  When the user clicks on the Close CTA on the page
  Then the drawer should close
  And should return to the My Bag Page
