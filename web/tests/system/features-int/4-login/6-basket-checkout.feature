Feature: Test Debenhams basket checkout page
@manual @DBNHST-1578 @DEBD-2562
Scenario Outline: Validate the checkout Sign in Page for Registered User
  Given I navigate to "homeURL"
  Then I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I navigate to "testDressPdpURL"
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

@automated @DDAI-322
Scenario: Navigate to Debenhams basket checkout page and validate the page
  Given I logout
  Then I navigate to "womenDressesPdpUrlInt"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  Then I should see "headerText" as "Welcome" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"
  And I should see "backSection" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"

@automated @DDAI-322
Scenario: Navigate to Debenhams basket checkout page and validate the error messages for empty email and password field
  Then I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "The Email address field cannot be empty" on "basketCheckoutPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "basketCheckoutPage"

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate the error messages for empty password and incorrect email
  Then I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "Enter a valid Email address" on "basketCheckoutPage"
  #When I click on "continueButton" on "basketCheckoutPage"
  #And I should see "emailErrorMessage" as "Invalid Email address format." on "basketCheckoutPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "basketCheckoutPage"

  Examples:
    | email |
    | user1 |

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate login with incorrect credentials
  Then I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "basketCheckoutPage"

  Examples:
    | email            | password |
    | user31@gmail.com | pass1    |



@automated @DDAI-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate show hide functiality for password
  Then I enter "<password>" in "passwordField" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "password" on "basketCheckoutPage"
  When I click on "showHideButton" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "text" on "basketCheckoutPage"
  When I click on "showHideButton" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "password" on "basketCheckoutPage"

  Examples:
    | password  |
    | password2 |

@automated @DDAI-322 @DDAI-324
Scenario Outline: Navigate to Debenhams basket checkout page and validate forgotten password link navigates to forgotten password page
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "forgotPasswordLink" on "basketCheckoutPage"
  # Then I should see "titleOfPage" as "Forgotten your password?" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"
  #And I should see value of "emailAddressField" as "<email>" on "forgotPasswordPage"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  When I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"
  And I should see "signInButon" exist on "emailReminderPage"


  Examples:
    | email                       | password   |
    | testautomationd21@gmail.com | password21 |

@automated @DDAI-322 @DDAI306
Scenario Outline: Navigate to Debenhams basket checkout page and validate login with valid credentials
  Given I logout
  Then I navigate to "womenDressesPdpUrlInt"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "headerText" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  Then I navigate to "loginUrl"
  And I wait for "3000" milliseconds
  And I logout

  Examples:
    | email                       | password   |
    | testautomationI70@gmail.com | password70 |

@automated @DDAI-322
Scenario: Navigate to Debenhams basket checkout page and validate the error messages for empty email with new customer request
  Given I logout
  Then I navigate to "womenDressesPdpUrlInt"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  And I wait for "3000" milliseconds
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "The Email address field cannot be empty" on "basketCheckoutPage"

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate the error messages for invalid email with new customer request
  Given I navigate to "womenDressesPdpUrlInt"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  And I wait for "3000" milliseconds
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "ENTER A VALID EMAIL ADDRESS" on "basketCheckoutPage"

  Examples:
    | email |
    | user1 |

@automated @DDAI-322 @DDAI306
Scenario Outline: Navigate to Debenhams basket checkout page and continue as new customer.
  Given I navigate to "womenDressesPdpUrlInt"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  When I click on "sizedropdown1" on "pdpPage"
  And I select available size from "dropdown"
  When I click on "addToBagButton" on "pdpPage"
  Then I click on "viewBasketCheckoutButton" on "pdpPage"
  Then I click on "checkoutButton" on "basketCheckoutPage"
  And I wait for "3000" milliseconds
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "headerText" as "WHERE ARE WE DELIVERING TO?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"

  Examples:
    | email            |
    | user31@gmail.com |

@automated @DBNHST-1578
Scenario: Validate the checkout Sign in Page for MVT variation-1
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"

@automated @DBNHST-1578
Scenario Outline: Validate the checkout Sign in Page for MVT variation-2 Ghost user
  Then I click on "closeButton" on "basketCheckoutPage"
  And I wait for "20000" milliseconds
  And I click on "checkoutButton" on "myBagPage"
  And I should see "loginGuest" exist on "basketCheckoutPage"
  And I should see "loginExisting" exist on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  Then I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "errorTextMessage" as "We've found an account related to this email address" on "basketCheckoutPage"
  Then I click on "closeButton" on "basketCheckoutPage"

  Examples:
    | email                       |
    | testautomationI70@gmail.com |

@automated @DBNHST-1578
Scenario Outline: Validate the checkout Sign in Page for MVT variation-2 Registered user
  Then I click on "checkoutButton" on "myBagPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"
  Then I click on "returningCustomerRadioButton" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

  Examples:
    | email                       | password   |
    | testautomationI70@gmail.com | password70 |

@manual @DBNHST-1578
Scenario Outline: Validate the checkout Sign in Page for MVT variation-3 Registered User
  Given I logout
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  And I should see "guestTab" exist on "basketCheckoutPage"
  And I should see "loginExisting" exist on "basketCheckoutPage"
  And I should see "closeButton" exist on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "headerTextUk" as "How would you like to receive your order?" on "deliveryOptionPage"

  Examples:
    | email                       | password   |
    | testautomationI70@gmail.com | password70 |

@manual @DBNHST-1578
Scenario Outline: Validate the checkout Sign in Page for MVT variation-3 Ghost User
  Given I logout
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  Then I click on "guestTab" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I should see "signInButton" exist on "basketCheckoutPage"
  Then I click on "signInButton" on "basketCheckoutPage"
  And I should see "errorTextMessage" as "We've found an account related to this email address" on "basketCheckoutPage"
  Then I click on "closeButton" on "basketCheckoutPage"

  Examples:
    | email                       |
    | testautomationI70@gmail.com |

@manual @DBNHST-1560
Scenario: Navigate to My bag page then click on checkout button and validate that the login page opens as a popout window.
