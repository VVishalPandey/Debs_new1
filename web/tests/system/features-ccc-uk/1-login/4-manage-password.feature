Feature: Test Agent manage password page upon for customer enactment

@automated  @DEBD-1972
Scenario Outline: validate the manage password page after  login
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "cccManagePasswordLink" exist on "cccCustomerSearchPage"
  When I click on "cccManagePasswordLink" on "cccCustomerSearchPage"
  Then I should see "cccChangePasswordTitle" as "Change Password and Security Settings" on "cccLoginPage"
  And I should see "cccChangePasswordheader" as "<headerText>" on "cccLoginPage"
  And I should see "cccExistingPassordInput" exist on "cccLoginPage"
  And I should see "cccNewPassordInput" exist on "cccLoginPage"
  And I should see "cccConfirmPassordInput" exist on "cccLoginPage"
  And I should see "cccPasswordValidator" exist on "cccLoginPage"
  And I should see "cccUpdateButton" exist on "cccLoginPage"
  And I should see "cccCancelButton" exist on "cccLoginPage"
  Examples:
    | email                                  | password   | headerText|
    | CSRUSER3| GOSH***4321 |Enter your current password in the box below. Once you have selected your new password click Update.|

@automated @DEBD-1972
Scenario Outline: validate show/hide functionality  for password field
  And I enter "<password>" in "cccExistingPassordInput" on "cccLoginPage"
  Then I validate "type" of "cccExistingPassordInput" as "password" on "cccLoginPage"
  When I click on "cccshowHideButton1" on "cccLoginPage"
  Then I validate "type" of "cccExistingPassordInput" as "text" on "cccLoginPage"
  When I click on "cccshowHideButton1" on "cccLoginPage"
  Then I validate "type" of "cccExistingPassordInput" as "password" on "cccLoginPage"
  And I enter "<password>" in "cccNewPassordInput" on "cccLoginPage"
  Then I validate "type" of "cccNewPassordInput" as "password" on "cccLoginPage"
  When I click on "cccshowHideButton2" on "cccLoginPage"
  Then I validate "type" of "cccNewPassordInput" as "text" on "cccLoginPage"
  When I click on "cccshowHideButton2" on "cccLoginPage"
  Then I validate "type" of "cccNewPassordInput" as "password" on "cccLoginPage"
  And I enter "<password>" in "cccConfirmPassordInput" on "cccLoginPage"
  Then I validate "type" of "cccConfirmPassordInput" as "password" on "cccLoginPage"
  When I click on "cccshowHideButton3" on "cccLoginPage"
  Then I validate "type" of "cccConfirmPassordInput" as "text" on "cccLoginPage"
  When I click on "cccshowHideButton3" on "cccLoginPage"
  Then I validate "type" of "cccConfirmPassordInput" as "password" on "cccLoginPage"
  Examples:
     | password |
     | pass1    |


@notAutomated @DEBD-1972
Scenario Outline: Navigate to change password password page and validate correct password characters
  Then  I enter "<password>" in "cccExistingPassordInput" on "cccLoginPage"
  And I enter "<password>" in "cccNewPassordInput" on "cccLoginPage"
  And I validate "class" of "cccTenCharPasswordReq" as "check" on "cccLoginPage"
  And I validate "class" of "cccUpperLowerCaseStatus" as "check" on "cccLoginPage"
  And I validate "class" of "cccSpecialCharStatus" as "check" on "cccLoginPage"
  And I validate "class" of "cccOneNumberStatus" as "check" on "cccLoginPage"
  And I click on "cccUpdatebutton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "The confirm password field cannot be empty" on "cccLoginPage"
  And I should verify "border-top-color" of "confirmPassInput" as "red" on "cccLoginPage"
  Examples:
   | password |
   | P@ssw0rd123    |

@notAutomated @DEBD-1972
Scenario: Navigate to manage password password page and validate cancel button
   When I click on "cancel" on "cccLoginPage"
   Then I should see "managPasswordLink" exist on "cccLoginPage"

@automated @DEBD-3308
Scenario Outline: validate error with blank fields
  Given I logout
  And I am enacting as a guest using CCC
  When I click on "cccManagePasswordLink" on "cccCustomerSearchPage"
  And I click on "cccUpdateButton" on "cccLoginPage"
  And I should see "cccExistingPasswordError" containing "<existingPasswordError>" on "cccLoginPage"
  And I should see "cccNewPasswordError" containing "<newPasswordError>" on "cccLoginPage"
  And I should see "cccConfirmPasswordError" containing "<confirmPasswordError>" on "cccLoginPage"

  Examples:
     | newPasswordError | confirmPasswordError | existingPasswordError |
     |The new password field cannot be empty | The confirm password field cannot be empty|The existing password field cannot be empty|

@automated @DEBD-3308
Scenario Outline: validate error with new incorrect password
  When I enter "<newPassword>" in "cccExistingPassordInput" on "cccLoginPage"
  Then I enter "<newPassword>" in "cccNewPassordInput" on "cccLoginPage"
  And I enter "<confirmPassword>" in "cccConfirmPassordInput" on "cccLoginPage"
  And I click on "cccUpdateButton" on "cccLoginPage"
  And I should see "cccNewPasswordError" containing "<newPasswordError>" on "cccLoginPage"
  And I should see "cccConfirmPasswordError" containing "<confirmPasswordError>" on "cccLoginPage"
  And I should verify "border-top-color" of "cccConfirmPassordInput" as "red" on "cccLoginPage"

  Examples:
     | newPassword | confirmPassword | newPasswordError | confirmPasswordError |
     | abc123456   |  abc1234678   |Password needs at least: 10 characters. | Passwords do not match|

Scenario Outline: Navigate to change password password page and validate correct password characters
  And I enter "<newPassword>" in "existingPass" on "cccLoginPage"
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

@notAutomated @DEBD-1972
Scenario Outline: Navigate to change password password page and validate correct password characters
  And I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I enter "<newPassword>" in "confirmPassInput" on "cccLoginPage"
  And I validate "class" of "sixCharacterStatus" as "check" on "cccLoginPage"
  And I validate "class" of "oneLetterStatus" as "check" on "cccLoginPage"
  And I validate "class" of "oneNumberStatus" as "check" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
  Then I should see "invalidLoginMessage" as "The existing password field cannot be empty" on "cccLoginPage"
  And I should verify "border-top-color" of "existingPassInput" as "red" on "cccLoginPage"
  Examples:
   | newPassword |
   | abc1245     |


@manual @DEBD-1972
Scenario Outline: Navigate to Debenhams change password page upon first time login correct password
  Given I logout
  When I enter "<email>" in "cccLoginField" on "cccLoginPage"
  And I enter "<password>" in "cccPasswordField" on "cccLoginPage"
  And I click on "cccSignInButton" on "cccLoginPage"
  Then I should see "managPasswordLink" exist on "cccLoginPage"
  When I click on "managPasswordLink" on "cccLoginPage"
  Then I enter "<existingPass>" in "existingPassword" on "cccLoginPage"
  Then I enter "<newPassword>" in "newPassInput" on "cccLoginPage"
  And I enter "<confirmPassword>" in "confirmPassInput" on "cccLoginPage"
  And I should see "setNewPasswordButton" turns "orange" on "cccLoginPage"
  And I click on "setNewPasswordButton" on "cccLoginPage"
   And I should see "cccSignOutLink" exist on "cccCustomerSearchPage"
  And I should see "cccManagePassword" exist on "cccCustomerSearchPage"
  And I should see "employeeName" as "cameron" on "cccCustomerSearchPage"


  Examples:
     |existingPass| newPassword |  confirmPassword |
     |passw0rd| abc123456   |  abc123456   |
