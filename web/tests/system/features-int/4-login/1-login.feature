Feature: Test Debenhams login page


@automated @DDAI-322
Scenario: Navigate to Debenhams login page and validate the title and tabs on page
  Given I logout
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  Then I navigate to "loginUrl"
  Then I should see "headerText" as "My Account" on "loginPage"
  And I should see "tab1" as "Sign In" on "loginPage"
  And I should see "tab2" as "Create an account" on "loginPage"

@automated @DDAI-322
Scenario: Navigate to Debenhams login page and validate Sign In section of login page
  Then I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "passwordField" exist on "loginPage"
  And I should see "signInButton" exist on "loginPage"
  And I should see "forgotPasswordLink" exist on "loginPage"
  And I should see "rememberMe" exist on "loginPage"
  And I should see "createAccountLink" exist on "loginPage"

@automated @DDAI-322
Scenario: Navigate to Debenhams login page and validate the error messages for empty email and password field on sign in
  When I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams login page and validate the error messages for empty password and incorrect email on sign in
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I wait for "2000" milliseconds
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

  Examples:
    | email |
    | user1 |

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams login page and validate login with incorrect credentials
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

  Examples:
    | email           | password |
    | user1@gmail.com | pass1    |

@manual @DDAI-322
Scenario Outline: Navigate to Debenhams login page and validate the remember me functionality
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  And I wait for "2000" milliseconds
  And I logout
  When I navigate to sign in page
  Then I should see value of "emailAddressFieldSignIn" as "testautomationd21@gmail.com" on "loginPage"

  Examples:
    | email                       | password   |
    | testautomationd21@gmail.com | password21 |

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams login page and validate show hide functiality for password
  Given I logout
  Then I navigate to "loginUrl"
  And I enter "<password>" in "passwordField" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  |
    | password2 |

@automated @DDAI-322
Scenario Outline: Navigate to Debenhams login page and validate login with valid credentials
  Then I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  And I wait for "2000" milliseconds

  Examples:
    | email                       | password   |
    | testautomationd21@gmail.com | password21 |

@manual @DDAI-322
Scenario: Navigate to Debenhams login page and validate automatic sign in on fresh browser if user has closed the logged in browser
  Given I logout
  Then I navigate to "loginUrl"
  And I provide valid credentials and login
  And I close browser
  When I navigate to "loginUrl" again
  Then I should be logged in

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the login page when user navigates on the Main logon Page on mobile and Tablet
  Given the user is not logged in
  When the user clicks on the Sign in from the left hand menu
  And the user navigates to the login  Page
  Then the user should not see the Remember Me Checkbox on the Login Page

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the Checkout Login page on mobile and Tablet
  Given the user is not logged in
  And the user adds the products to the basket
  When the user clicks on the proceed to checkout button
  And user navigates to the Checkout Login Page
  Then the user should not see the Remember Me Checkbox

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the save for later page on mobile and Tablet
  Given the user is not logged in
  When the user clicks on the save for later page from the left hand menu
  And the user navigates to the save for later with create Account screen Page
  Then the user should not see the Remember Me Checkbox

@manual @DDAI-826
Scenario: Validation of the removal of the remember me checkbox on the Beauty club login page on mobile and Tablet
  Given the user is not logged in
  When the user clicks on the Beauty Club page from the left hand menu
  And the user navigates to the Beauty club login page
  Then the user should not see the Remember Me Checkbox
