Feature: Test Debenhams Dotie basket checkout page and ghost page

@manual @DBMTE-322
Scenario: Navigate to Debenhams basket checkout page and validate the page
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  Then I should see "headerText" as "Would you like to..." on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"

@manual @DBMTE-322
Scenario: Navigate to Debenhams basket checkout page and validate the error messages for empty email and password field
  When I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "basketCheckoutPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "basketCheckoutPage"

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate the error messages for empty password and incorrect email
  Given I navigate to basket checkout login page
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "basketCheckoutPage"
  When I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "basketCheckoutPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "basketCheckoutPage"

  Examples:
    | email |
    | user1 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate login with incorrect credentials
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "basketCheckoutPage"

  Examples:
    | email           | password |
    | user2@gmail.com | pass1    |

@manual @DBMTE-322 @Issue8
Scenario Outline: Navigate to Debenhams basket checkout page and validate login with incorrect password and lock account
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "passwordErrorMessage" as "Password incorrect - Please check your details and try again." on "basketCheckoutPage"
  When I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "passwordErrorMessage" as "Password incorrect - You have 2 attempts left before your account will be locked." on "basketCheckoutPage"
  When I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "passwordErrorMessage" as "Password incorrect - You have 1 attempts left before your account will be locked." on "basketCheckoutPage"
  When I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "passwordErrorMessage" as "Account locked - Reset your password to reactivate it" on "basketCheckoutPage"
  And I should see "errorTextMessage" as "Account locked There was an issue with the password entered. Please reset your password to reactivate your account." on "basketCheckoutPage"

  Examples:
    | email   | password |
    | a@a.com | pass1    |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate show hide functiality for password
  Given I navigate to basket checkout login page
  When I enter "<password>" in "passwordField" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "password" on "basketCheckoutPage"
  When I click on "showHideButton" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "text" on "basketCheckoutPage"
  When I click on "showHideButton" on "basketCheckoutPage"
  Then I validate "type" of "passwordFieldType" as "password" on "basketCheckoutPage"

  Examples:
    | password  |
    | password2 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate forgotten password link navigates to forgotten password page
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "forgotPasswordLink" on "basketCheckoutPage"
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"
  And I should see value of "emailAddressField" as "<email>" on "forgotPasswordPage"
  When I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"
  And I should see "signInButon" exist on "emailReminderPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate login with valid credentials
  Given I navigate to basket checkout login page
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I enter "<password>" in "passwordField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"
  Then I navigate to "loginUrl"
  And I logout

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBMTE-322
Scenario: Navigate to Debenhams basket checkout page and validate the error messages for empty email with new customer request
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "basketCheckoutPage"

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate the error messages for invalid email with new customer request
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "basketCheckoutPage"

  Examples:
    | email |
    | user1 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams basket checkout page and validate the error messages for invalid email with new customer request
  Given I navigate to basket checkout login page
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"

  Examples:
    | email           |
    | user2@gmail.com |

@manual @DBMTE-322
Scenario: Navigate to My bag page then click on checkout button and validate that the login page opens as a popout window.

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the page
  Given I navigate to "testDressPdpURL"
  When I am in view of "allSizeElements" on "pdpPage"
  Then I add the product to bag and go to my bag page
  And I click on "checkoutButton" on "myBagPage"
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I should see "signInButton" exist on "ghostPage"
  And I should see "continueAsGuestButton" exist on "ghostPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on sign in button
  Given I navigate to basket checkout login page
  When I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "signInButton" on "ghostPage"
  Then I should see "headerText" as "Welcome" on "basketCheckoutPage"
  And I should see "emailAddressField" exist on "basketCheckoutPage"
  And I should see "passwordField" exist on "basketCheckoutPage"
  And I should see "forgotPasswordLink" exist on "basketCheckoutPage"
  And I should see "continueButton" exist on "basketCheckoutPage"
  And I should see "backSection" exist on "basketCheckoutPage"
  And I should see "newCustomerRadioButton" exist on "basketCheckoutPage"
  And I should see "returningCustomerRadioButton" exist on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-322 @Issue217Fixed
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the back button functionality
  Given I navigate to basket checkout login page
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "backSection" on "ghostPage"
  Then I should see "headerText" as "My Bag" on "myBagPage"
  And I should see "checkoutButton" exist on "myBagPage"
  And I should see "checkoutButton2" exist on "myBagPage"
  And I should see "creditCardInfo" exist on "myBagPage"
  And I should see "headerItemsCount" exist on "myBagPage"
  And I should see "totalItemsCount" exist on "myBagPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams ghost page from basket checkout and validate the navigation when clicked on continue as guest button
  Given I navigate to basket checkout login page
  When I enter "<email>" in "emailAddressField" on "basketCheckoutPage"
  And I click on "newCustomerRadioButton" on "basketCheckoutPage"
  And I click on "continueButton" on "basketCheckoutPage"
  Then I should see "errorTextMessage" as "We've found an account related to this email address" on "ghostPage"
  And I wait for "2000" milliseconds
  When I click on "continueAsGuestButton" on "ghostPage"
  Then I should see "headerText" as "How would you like to receive your order?" on "deliveryOptionPage"
  And I should not see "continueButton" on "basketCheckoutPage"
  And I should not see "emailAddressField" on "basketCheckoutPage"
  And I should not see "passwordField" on "basketCheckoutPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |
