Feature: Test Debenhams login page

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate the title and tabs on page
  Given I navigate to "loginUrl"
  # Then I should see "titleOfPage" as "Sign In" on "loginPage"
  And I should see "headerText" as "My Account" on "loginPage"
  And I should see "tab1" as "Sign In" on "loginPage"
  And I should see "tab2" as "Create an account" on "loginPage"

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate Sign In section of login page
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  Then I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "passwordField" exist on "loginPage"
  And I should see "signInButton" exist on "loginPage"
  And I should see "forgotPasswordLink" exist on "loginPage"
  And I should see "rememberMe" exist on "loginPage"
  And I should see "createAccountLink" exist on "loginPage"

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate create an account section of login page
  Given I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  Then I should see "emailAddressFieldCreateAccount" exist on "loginPage"
  And I should see "createAccountButton" exist on "loginPage"

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate error message in case of no email in create account
  Given I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "emailErrorMessageCreateAccount" as "The email address field cannot be empty" on "loginPage"

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams create account section on login page and validate the error on providing existing email
  Given I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "errorTextMessage" as "It appears you've already registered, please sign in." on "loginPage"

  Examples:
    | email                      |
    | testautomationd2@gmail.com |

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams create account section on login page and validate the error on providing email with incorrect format
  Given I navigate to "loginUrl"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "emailErrorMessageCreateAccount" as "Enter a valid email address" on "loginPage"

  Examples:
    | email |
    | user1 |

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate the error messages for empty email and password field on sign in
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "The email address field cannot be empty" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams login page and validate the error messages for empty password and incorrect email on sign in
  Given I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "emailErrorMessage" as "Enter a valid email address" on "loginPage"
  And I should see "passwordErrorMessage" as "The password field cannot be empty" on "loginPage"

  Examples:
    | email | password |
    | user1 |          |

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams login page and validate login with incorrect credentials
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "invalidLoginMessage" as "We can't find an account with this email address. Please check your email address and try again or register for a new account." on "loginPage"

  Examples:
    | email           | password |
    | user1@gmail.com | pass1    |

@manual
Scenario Outline: Navigate to Debenhams my details page and validate the newletter message for yes and no
  Given I navigate to "loginUrl"
  When I enter "<emailNewsYes>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordNewsYes>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "newsletterMessage" as "Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions" on "myDetailsPage"
  And I logout
  When I navigate to "loginUrl"
  And I enter "<emailNewsNo>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<passwordNewsNo>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "newsletterMessage" as "No, please don't send me email newsletters" on "myDetailsPage"

  Examples:
    | emailNewsYes                | passwordNewsYes | emailNewsNo                | passwordNewsNo |
    | testmy@debs.com | password2    | testautomationd2@gmail.com | password2      |

@manual @DBMTE-138 @Issue157
Scenario Outline: Navigate to Debenhams login page and validate the remember me functionality
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I click on "rememberMe" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  # And I should see "titleOfPage" as "My Account" on "myDetailsPage"
  And I should see "headerText" as "My account" on "myDetailsPage"
  And I logout
  When I navigate to sign in page
  And I wait for "4000" milliseconds
  Then I should see value of "emailAddressFieldSignIn" as "testautomationd2@gmail.com" on "loginPage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBMTE-138
Scenario: Navigate to Debenhams login page and validate automatic sign in on fresh browser if user has closed the logged in browser
  Given I navigate to "loginUrl"
  And I provide valid credentials and login
  And I close browser
  When I navigate to "loginUrl" again
  Then I should be logged in

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams login page and validate show hide functiality for password
  Given I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  |
    | password2 |

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams login page and validate login with valid credentials
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"

  Examples:
    | email                      | password  |
    | testautomationd2@gmail.com | password2 |

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams my account page and validate the page with nlogin having newsletter subscription as no
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"

  Examples:
    | email                      | full_name    | newsletter_message                         |
    | testautomationd2@gmail.com | Mr Test User | No, please don't send me email newsletters |

@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams my account page from women dresses page and validate the page
  Given I logout
  Then I am on my details page
  And I navigate to "womenDressesPspUrl"
  When I click on "menuIcon" on "commonPage"
  #And I "validate & click" option is available in "mainMenuList" as "My Account" on "commonPage"
  Then I should see value of position "6" as "My Account"
  When I click on "My Account" position "6"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"

  Examples:
    | email                      | full_name    | newsletter_message                         |
    | testautomationd2@gmail.com | Mr Test User | No, please don't send me email newsletters |


@manual @DBMTE-138
Scenario Outline: Navigate to Debenhams my account page and validate the page with login having newsletter subscription as yes
  Given I logout
  Then I navigate to "loginUrl"
  When I click on "tab1" on "loginPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "editDetailsLink" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "beautyClubButton" exist on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"

  Examples:
    | email                       | password   | full_name         | newsletter_message                                                                                           |
    | testmy@debs.com | password2 | Mrs Test User| Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions |


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
