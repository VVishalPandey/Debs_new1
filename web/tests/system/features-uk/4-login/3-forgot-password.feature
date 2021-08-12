Feature: Test Debenhams find forgot password page

@automated @DBNHST-7 @Fixed
Scenario: Navigate to Debenhams forgot password page and validate the page
  Given I logout
  When I navigate to "forgotPasswordUrl"
  # Then I should see "titleOfPage" as "Forgotten your password?" on "forgotPasswordPage"
  Then I should see "headerText" as "Forgotten your password?" on "forgotPasswordPage"
  And I should see "resetPasswordText" as "Reset your password" on "forgotPasswordPage"
  And I should see "resetPasswordMessage" as "If you have forgotten your password, type in your account email - this is the email address you provided when setting up your account - and we will send you a link so you can reset your password." on "forgotPasswordPage"
  And I should see "emailAddressField" exist on "forgotPasswordPage"
  And I should see "resetPasswordButton" exist on "forgotPasswordPage"

@automated @DBNHST-7 @Fixed
Scenario Outline: Navigate to Debenhams forgot password page and validate the error message with incorrect email address
   When I navigate to "forgotPasswordUrl"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "forgotPasswordPage"

  Examples:
    | email |
    | aaaa  |

@automated @DBNHST-7 @Fixed
Scenario: Navigate to Debenhams forgot password page and validate the error message when no email is provided
  When I navigate to "forgotPasswordUrl"
  When I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "forgotPasswordPage"

@automated @DBNHST-7 @Fixed
Scenario Outline: Navigate to Debenhams forgot password page and validate the error message with email that doesn't exist
  When I navigate to "forgotPasswordUrl"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  Then I should see "errorTextMessage" as "We can't find an account with this email address. Please check your email address and try again or create a new account." on "forgotPasswordPage"

  Examples:
    | email           |
    | user21@gmail.com |

@automated @DBNHST-7 @Fixed
Scenario Outline: Navigate to Debenhams forgot password page where email should be prefilled as per the input on the login page
  Given I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "forgotPasswordLink" on "loginPage"
  Then I should see value of "emailAddressField" as "<email>" on "forgotPasswordPage"

  Examples:
    | email              |
    | testuser@gmail.com |

@automated @DBNHST-7 @DBNHST-8 @Fixed
Scenario Outline: Navigate to Debenhams forgot password page, provide a correct email address and validate the email reminder page
  When I navigate to "forgotPasswordUrl"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  # Then I should see "titleOfPage" as "Password" on "emailReminderPage"
  Then I should see "headerText" as "Forgotten your password?" on "emailReminderPage"
  And I should see "forgotPasswordMessage1" as "Thank you for requesting a password reset, we will shortly email you a link you can use to reset your password. After clicking the link you will be asked to create a new password." on "emailReminderPage"
  And I should see "forgotPasswordMessage2" as "Please allow up to 15 minutes for the password reset email to arrive. If the email hasn't arrived by this time, please make sure you check your spam." on "emailReminderPage"
  And I should see "goShoppingButon" exist on "emailReminderPage"
  And I should see "signInButon" exist on "emailReminderPage"

  Examples:
    | email                      |
    | testautomationd1@gmail.com |

@automated @DBNHST-8 @Fixed
Scenario Outline: Navigate to Debenhams email reminder page from forgot password and validate page when selected continue shopping
  When I navigate to "forgotPasswordUrl"
  When I enter "<email>" in "emailAddressField" on "forgotPasswordPage"
  And I click on "resetPasswordButton" on "forgotPasswordPage"
  And I click on "goShoppingButon" on "emailReminderPage"
  # Then I should see "titleOfPage" as "Debenhams UK - Fashion, Beauty, Gifts, Furniture & Electricals" on "homePage"
  Then I should not see "signInButon" on "emailReminderPage"
  And I should not see "goShoppingButon" on "emailReminderPage"

  Examples:
    | email                      |
    | testautomationd1@gmail.com |

@manual @DBNHST-8 @DBNHST-9
Scenario: Validate that the email is recived ofor forgot password and on clicking the link able to set password
  Given I navigate to forgot password page and provided valid email
  Then I should receive email
  When I click on forgot password link
  Then I should be navigated to change password page where I can change my password
  And I am able to change password correctly as per the criteria


@manual @DBNHST-8 @DBNHST-9
Scenario: Validate Password reset page
  Given I navigate to reset password page accesed by email link
  Then I should see Customer name 
  And I should not see "signIn" on "commonPage"
  And I should see "Change PasswordTitle" exist on "registrationPage"
  And I should see  "newPassword" exist on "registrationPage"
  And I should see  "newPasswordAtleastTitle" exist on "registrationPage"
  And I should see  "setNewPasswordButton" exist on "registrationPage"
