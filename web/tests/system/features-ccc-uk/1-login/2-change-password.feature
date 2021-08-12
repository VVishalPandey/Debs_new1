Feature: Test Agent change password page upon first time login for customer enactment

@notAutomated @DEBD-3308
Scenario Outline: validate the change password page upong first time login on CCCLogin page
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  And I should see "cccChangePasswordTitle" as "Change Password and Security Settings" on "cccLoginPage"
  And I should see "changePasswordContent" as "Enter new password for" on "cccLoginPage"
  And I should see "newPassSection" exist on "cccLoginPage"
  And I should see "confirmPassSection" exist on "cccLoginPage"
  And I should see "passwordValidator" exist on "cccLoginPage"
  And I should see "setNewPasswordButton" exist on "cccLoginPage"
  Examples:
    | email                                  | password   |
    | cameron.wortlehock@publicissapient.com | P@&&V4MKX1XA |


@notAutomated @DEBD-3308
Scenario Outline: Navigate to change password password page and validate correct password characters
  And I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I validate "class" of "sixCharacterStatus" as "check" on "cccLoginPage"
  And I validate "class" of "oneLetterStatus" as "check" on "cccLoginPage"
  And I validate "class" of "oneNumberStatus" as "check" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "The confirm password field cannot be empty" on "cccLoginPage"
  And I should verify "border-top-color" of "confirmPassInput" as "red" on "cccLoginPage"
  Examples:
   | newPassword |
   | abc1245     |

@notAutomated @DEBD-3308
Scenario: Navigate to change password  page and validate correct password characters
  And I enter "" in "newPassInput" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "The new password field cannot be empty" on "cccLoginPage"
  And I should verify "border-top-color" of "newpasswordField" as "red" on "cccLoginPage"

@notAutomated @DEBD-3308
Scenario Outline: Navigate to CCC change password page upon first time login validate error with new incorrect password
  Then I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I enter "<newPassword>" in "confirmPassInput" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
  And I validate "class" of "sixCharacterStatus" as "caution" on "cccLoginPage"
  And I validate "class" of "oneLetterStatus" as "check" on "cccLoginPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "cccLoginPage"
  And I should see "passwordError" as "Incorrect password - Please check details and try again." on "cccLoginPage"
  And I should see "charactersValidationError" exist on "cccLoginPage"
  And I should see "numberValidationError" exist on "cccLoginPage"

  Examples:
     | newPassword |
     | abc         |

@notAutomated @DEBD-3308
Scenario Outline: Navigate to Debenhams change password page upon first time login and validate error with new incorrect password
  Then I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I enter "<confirmPassword>" in "confirmPassInput" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
  And I should see "passwordError" as "The passwords entered do not match" on "cccLoginPage"
  And I should verify "border-top-color" of "confirmPassInput" as "red" on "cccLoginPage"

  Examples:
     | newPassword |  confirmPassword |
     | abc123456   |  abc1234678   |

@notAutomated @DEBD-3308
Scenario Outline: validate show/hide functionality  for password field
  Given I logout
  And I enter "<password>" in "newPassInput" on "cccLoginPage"
  Then I validate "type" of "newPassInput" as "password" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "newPassInput" as "text" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "newPassInput" as "password" on "cccLoginPage"
  And I enter "<password>" in "confirmPassInput" on "cccLoginPage"
  Then I validate "type" of "confirmPassInput" as "password" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "confirmPassInput" as "text" on "cccLoginPage"
  When I click on "showHideButton" on "cccLoginPage"
  Then I validate "type" of "confirmPassInput" as "password" on "cccLoginPage"
  Examples:
     | password |
     | pass1    |

@manual @DEBD-3308
Scenario Outline: Navigate to Debenhams change password page upon first time login correct password
  Then I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I enter "<confirmPassword>" in "confirmPassInput" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
   And I should see "cccSignOutLink" exist on "cccCustomerSearchPage"
  And I should see "cccManagePassword" exist on "cccCustomerSearchPage"
  And I should see "employeeName" as "cameron" on "cccCustomerSearchPage"


  Examples:
     | newPassword |  confirmPassword |
     | abc123456   |  abc123456   |