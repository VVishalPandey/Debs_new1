Feature: Test Debenhams Dotie account locked page

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams login page and validate login with incorrect password with account locked
  Given I navigate to forgot password page
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Password incorrect - Please check your details and try again." on "loginPage"
  When I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Password incorrect - You have 2 attempts left before your account will be locked." on "loginPage"
  When I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Password incorrect - You have 1 attempts left before your account will be locked." on "loginPage"
  When I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"

  Examples:
    | email   | password |
    | a@a.com | pass     |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams account locked page from login page and validate the page
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"
  When I click on "resetPassword" on "loginPage"
  # Then I should see "titleOfPage" as "Account locked" on "accountLockedPage"
  Then I should see "headerText" as "Account locked" on "accountLockedPage"
  And I should see value of "emailAddressField" as "<email>" on "accountLockedPage"
  And I should see "resetPasswordText" as "Please reset your password" on "accountLockedPage"
  And I should see "accountLockedMessage" as "As your account has been locked, please type in the email address you provided when setting up your account - and we will send you a link so you can reset your password." on "accountLockedPage"
  And I should see "emailAddressField" exist on "accountLockedPage"
  And I should see "resetPasswordButton" exist on "accountLockedPage"

  Examples:
    | email   | password |
    | a@a.com | pass     |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams account locked page validate error with incomplete email
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"
  When I click on "resetPassword" on "loginPage"
  And I enter "<email1>" in "emailAddressField" on "accountLockedPage"
  And I click on "resetPasswordButton" on "accountLockedPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "accountLockedPage"

  Examples:
    | email   | password | email1 |
    | a@a.com | pass     | user1  |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams account locked page validate error with empty email
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"
  When I click on "resetPassword" on "loginPage"
  And I enter "<email1>" in "emailAddressField" on "accountLockedPage"
  And I click on "resetPasswordButton" on "accountLockedPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "accountLockedPage"

  Examples:
    | email   | password | email1 |
    | a@a.com | pass     |        |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams account locked page validate error with incorrect email
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"
  When I click on "resetPassword" on "loginPage"
  And I enter "<email1>" in "emailAddressField" on "accountLockedPage"
  And I click on "resetPasswordButton" on "accountLockedPage"
  Then I should see "errorTextMessage" as "We can't find an account with this email address. Please check your email address and try again or create a new account." on "accountLockedPage"

  Examples:
    | email   | password | email1          |
    | a@a.com | pass     | user5@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams account locked page navigation to forgotton password page on valid email address
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "Account lockedThere was an issue with the password entered. Please reset your password to reactivate your account." on "loginPage"
  When I click on "resetPassword" on "loginPage"
  And I click on "resetPasswordButton" on "accountLockedPage"
  # Then I should see "titleOfPage" as "Password" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"
  And I should see "signInButon" exist on "emailReminderPage"

  Examples:
    | email   | password |
    | a@a.com | pass     |
