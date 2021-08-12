Feature: Test Debenhams find forgot password page

@automated @DEBD-267
Scenario: Navigate to Debenhams forgot password page and validate the page
  # Given I navigate to "homeURL"
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  When I click on "forgotPasswordLink" on "loginPage"
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"
  And I should see "resetPasswordText" as "Reset your password" on "forgotPasswordPage"
  And I should see "resetPasswordMessage" as "If you have forgotten your password, type in your account email - this is the email address you provided when setting up your account - and we will send you a link so you can reset your password." on "forgotPasswordPage"
  And I should see "emailAddressField" exist on "forgotPasswordPage"
  And I should see "resetPasswordButton" exist on "forgotPasswordPage"

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams forgot password page and validate the error message with incorrect email address
  And I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "forgotPasswordPage"

  Examples:
    | email |
    | aaaa  |

@automated @DEBD-267
Scenario: Navigate to Debenhams forgot password page and validate the error message when no email is provided
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  When I click on "forgotPasswordLink" on "loginPage"
  When I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "forgotPasswordPage"

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams forgot password page and validate the error message with email that doesn't exist
  And I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "errorTextMessage" as "We can't find an account with this email address. Please check your email address and try again or create a new account." on "forgotPasswordPage"

  Examples:
    | email           |
    | user1@gmail.com |

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams forgot password page and validate the create account functionality in error message for invalid email
  And I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  When I click on "resetPasswordButton" on "forgotPasswordPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"

  Examples:
    | email           |
    | user2@gmail.com |

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams forgot password page where email should be prefilled as per the input on the login page
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "forgotPasswordLink" on "loginPage"
  Then I should see value of "emailAddressField" as "<email>" on "forgotPasswordPage"

  Examples:
    | email              |
    | testuser@gmail.com |

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams forgot password page, provide a correct email address and validate the email reminder page
  And I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"

  Examples:
    | email                      |
    | testautomationd1@gmail.com |


@automated @DEBD-267
Scenario Outline: Validate that forgot password functionaity will recognize the email address created in DOTINT for DOTCOM and viceversa
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  When I click on "forgotPasswordLink" on "loginPage"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  # Then I should see "titleOfPage" as "Password" on "emailReminderPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"

  Examples:
    | email            |
    | dotcom@gmail.com |
    | dotint@gmail.com |

@automated @DEBD-267
Scenario Outline: Navigate to Debenhams email reminder page from forgot password and validate page when selected continue shopping
  Given I logout
  When I navigate to "homeURL"
  And I am in view of "countrySelectorLink" on "commonPage"
  And I "validate & click" country as "Australia" from "countryOptions" on "commonPage"
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab1" on "loginPage"
  When I click on "forgotPasswordLink" on "loginPage"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  And I click on "goShoppingButon" on "emailReminderPage"
  And I should not see "goShoppingButon" on "emailReminderPage"

  Examples:
    | email                      |
    | testautomationd1@gmail.com |


@manual @DEBD-267
Scenario Outline:Validate the UI of Forgot your password page for invalid email
  Given I navigate to "forgotPasswordUrl"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then the field border will turn red
  And I should see an inline error message 'Enter a valid email address'

  Examples:
    | email     |
    | testtiond1 |

@manual @DEBD-1119
Scenario: Validate that the email is recived ofor forgot password and on clicking the link able to set password
  Given I navigate to forgot password page and provided valid email
  Then I should receive email
  When I click on forgot password link
  Then I should be navigated to change password page where I can change my password
  And I am able to change password correctly as per the criteria


@manual @DEBD-1119
Scenario: Navigate to Debenhams reset password page and validate incorrect password scenario with all numerics
  Given I navigate to "resetPassword"
  And I click on "setNewPassword" on "resetPasswordPage"
  Then I should see "passwordErrorTextMessage" as "The password field cannot be empty" on "registerPage"


@manual @DEBD-1119
Scenario Outline: Navigate to Debenhams reset password page and validate show hide functiality for password
  Given I navigate to "resetPassword"
  And I enter "<password>" in "passwordField" on "resetPasswordPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  |
    | password2 |

@manual @DEBD-1119
Scenario Outline: Navigate to Debenhams reset password page and validate error message when user typed in more than three characters consecutively
  Given I navigate to "resetPassword"
  And I enter "<password>" in "passwordField" on "resetPasswordPage"
  And I am in view of "setNewPassword" on "resetPasswordPage"
  And I click on "setNewPassword" on "resetPasswordPage"
  Then I should see "errorTextMessage" as "Error:A character in your password occurs more consecutively than the allowed limit of 3. Please re-enter your password." on "registerPage"

  Examples:
    | firstName | lastname | password |
    | Test      | User     | @@@eee  |


@manual @DEBD-1119
Scenario Outline: Navigate to Debenhams reset password page and validate user is able to se the password sucessfully
  Given I navigate to "resetPassword"
  And I enter "<password>" in "passwordField" on "resetPasswordPage"
  And I am in view of "setNewPassword" on "resetPasswordPage"
  And I click on "setNewPassword" on "resetPasswordPage"
  And I should see "url" contains "/myaccount"

  Examples:
    | firstName | lastname | password |
    | Test      | User     | @@@eee  |

@manual @DEBD-1119
Scenario: Validate rules in  password validation should update upon typing the characters
  Given I navigate to "resetPassword"
  And I enter password by one valid character as per rule
  And I should see Green ticks on the Passowrd validations


@manual @DEBD-1119
Scenario Outline: Navigate to Debenhams reset password page and validate password info icons and check icon on valid password
  Given I navigate to "resetPassword"
  And I validate "class" of "sixCharacterStatus" as "info" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "info" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "info" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"

  Examples:
    | password  |
    | password2 |
