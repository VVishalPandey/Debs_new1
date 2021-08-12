Feature: Test Debenhams Dotie my saved item page

@manual @DBMTE-322
Scenario: Navigate to Debenhams my saved login page and validate the title and tabs on page
  Given I navigate to my saved item login page
  And I should see "headerText" as "My saved Items" on "mySavedItemPage"
  And I should see "savedItemMessage" as "Sign in or register to start adding your favourite items!" on "mySavedItemPage"
  And I should see "tab1" as "Sign In" on "mySavedItemPage"
  And I should see "tab2" as "Create an account" on "mySavedItemPage"

@manual @DBMTE-322
Scenario: Navigate to Debenhams my saved login page and validate Sign In section of login page
  Given I navigate to my saved item login page
  When I click on "tab1" on "mySavedItemPage"
  Then I should see "emailAddressFieldSignIn" exist on "mySavedItemPage"
  And I should see "passwordField" exist on "mySavedItemPage"
  And I should see "signInButton" exist on "mySavedItemPage"
  And I should see "forgotPasswordLink" exist on "mySavedItemPage"
  And I should see "rememberMe" exist on "mySavedItemPage"
  And I should see "createAccountLink" exist on "mySavedItemPage"

@manual @DBMTE-322
Scenario: Navigate to Debenhams my saved login page and validate create an account section of login page
  Given I navigate to my saved item login page
  When I click on "tab2" on "mySavedItemPage"
  Then I should see "emailAddressFieldCreateAccount" exist on "mySavedItemPage"
  And I should see "createAccountButton" exist on "mySavedItemPage"

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams my saved login page and validate the error messages for empty password and incorrect email on sign in
  Given I navigate to my saved item login page
  When I enter "<email>" in "emailAddressFieldSignIn" on "mySavedItemPage"
  And I click on "signInButton" on "mySavedItemPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "mySavedItemPage"
  When I click on "signInButton" on "mySavedItemPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "mySavedItemPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "mySavedItemPage"

  Examples:
    | email |
    | user1 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams my saved login page and validate login with incorrect credentials
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab1" on "mySavedItemPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "mySavedItemPage"
  And I enter "<password>" in "passwordField" on "mySavedItemPage"
  And I click on "signInButton" on "mySavedItemPage"
  Then I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "mySavedItemPage"

  Examples:
    | email           | password |
    | user2@gmail.com | pass1    |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams my saved login page and validate show hide functiality for password
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab1" on "mySavedItemPage"
  And I enter "<password>" in "passwordField" on "mySavedItemPage"
  Then I validate "type" of "passwordFieldType" as "password" on "mySavedItemPage"
  When I click on "showHideButton" on "mySavedItemPage"
  Then I validate "type" of "passwordFieldType" as "text" on "mySavedItemPage"
  When I click on "showHideButton" on "mySavedItemPage"
  Then I validate "type" of "passwordFieldType" as "password" on "mySavedItemPage"

  Examples:
    | password  |
    | password2 |

@manual @DBMTE-322
Scenario: Navigate to Debenhams my saved login page and validate error message in case of no email in create account
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab2" on "mySavedItemPage"
  And I click on "createAccountButton" on "mySavedItemPage"
  Then I should see "emailErrorMessageCreateAccount" as "The email address field cannot be empty" on "mySavedItemPage"

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams create account section on my saved login page and validate the error on providing existing email
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab2" on "mySavedItemPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "mySavedItemPage"
  And I click on "createAccountButton" on "mySavedItemPage"
  Then I should see "errorTextMessage" as "It appears you've already registered, please sign in." on "loginPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams create account section on my saved login page and validate the error on providing incorrect email address
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab2" on "mySavedItemPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "mySavedItemPage"
  And I click on "createAccountButton" on "mySavedItemPage"
  Then I should see "emailErrorMessageCreateAccount" as "Enter a valid email address" on "mySavedItemPage"

  Examples:
    | email |
    | user1 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams my saved login page and validate create an account title and header with email field as pre-filled
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab2" on "mySavedItemPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "mySavedItemPage"
  And I click on "createAccountButton" on "mySavedItemPage"
  Then I wait for "createAccountButton" element to be visible on "registerPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  Then I should see value of "emailAddressField" as "<email>" on "registerPage"

  Examples:
    | email           |
    | user2@gmail.com |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams my saved login page and validate login with valid credentials
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab1" on "mySavedItemPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "mySavedItemPage"
  And I enter "<password>" in "passwordField" on "mySavedItemPage"
  And I click on "signInButton" on "mySavedItemPage"
  # And I should see "Message" as "You haven't saved anything yet!" on "mySavedItemPage"
  And I should not see "tab1" on "mySavedItemPage"
  And I should not see "tab2" on "mySavedItemPage"
  And I should not see "signInButton" on "mySavedItemPage"
  And I should see "headerText" as "My Saved Items" on "mySavedItemPage"
  And I logout

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBMTE-322
Scenario Outline: Navigate to Debenhams create account page and create an account and validate the my saved item page
  Given I navigate to "mySavedItemPageUrl"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  And I should see "headerText" as "My saved Items" on "mySavedItemPage"
  # And I should see "Message" as "You haven't saved anything yet!" on "mySavedItemPage"

  Examples:
    | firstName | lastname | email                       | password   |
    | Test      | User     | testautomationd72@gmail.com | password72 |
