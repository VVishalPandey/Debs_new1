Feature: Test Debenhams create account page

@automated @DEBD-1027 @DEBD-299 @DEBD-299
Scenario Outline: Navigate to Debenhams login page and validate create an account title and header with email field as pre-filled
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "headerText" as "Create an account" on "registerPage"
  And I should see "emailAddressFieldSignIn" as "<emailaddress>" on "loginPage"

  Examples:
    | emailaddress           |
    | testuserire1@gmail.com |

@automated @DEBD-1027 @DEBD-299
Scenario: Navigate to Debenhams create account page and validate the form
  And I should see "titlefield" exist on "registerPage"
  And I should see "firstNameField" exist on "registerPage"
  And I should see "lastNamefield" exist on "registerPage"
  And I should see "emailAddressFieldSignIn" exist on "loginPage"
  And I should see "passwordField" exist on "registerPage"
  And I should see "showHideButton" exist on "loginPage"
  And I should see "passwordRequirementsText" exist on "registerPage"
  And I should see "createAccountButton" exist on "registerPage"
  And I should see "subscribeOption" exist on "registerPage"
  And I verify "href" of "privacy" as "PrivacyLink" on "commonPage"
  And I should see "createAccountButton" exist on "registerPage"


@notAutomated @DEBD-1027 @DEBD-299
Scenario Outline: Navigate to Create a account form and validate your new account page 
  # Given I logout
  # When I create a new account
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastName>" in "lastNamefield" on "registerPage"
  And I wait for "5000" milliseconds
  And I click on "createAccountButton" on "registerPage"
  And I wait for "5000" milliseconds
  And I should see "url" contains "/new-user"
  And I should see "headerText" as "Your new account" on "pspPage"
  And I should see "thankyouMessage1" exist on "registerPage"
  And I should see "thankyouMessage2" exist on "registerPage"
  And I should see "continueShopping" exist on "pspPage"
  When I click on "MyAccount" on "commonPage"
  Then I should see "myAccountLink" exist on "commonPage"
  And I should see "signOutLink" exist on "commonPage"
  And I should not see "createAccountLink" on "commonPage"

@automated @DEBD-299
Scenario Outline: Navigate to Debenhams create account page and validate invalid/incomplete email address scenario
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "emailErrorTextMessage" as "Enter a valid email address" on "registerPage"
  
  Examples:
    | emailaddress | 
    | test         |

@automated @DEBD-299
Scenario Outline: Navigate to Debenhams create account tab and validate existing email address scenario
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "emailErrorTextMessage" as "Enter a valid email address" on "registerPage"
  
  Examples:
    | emailaddress            |  
    | dotieirel d@yopmail.com |

@automated @DEBD-1027 @DEBD-299
Scenario Outline: Navigate to Debenhams create account page and validate existing email address scenario
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastName>" in "lastNamefield" on "registerPage"
  And I enter "<existingEmail>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<existingPassword>" in "passwordField" on "loginPage"
  And I wait for "5000" milliseconds
  And I click on "createAccountButton" on "registerPage"
  Then I should see "emailErrorCreateAccount" as "Error:The Logon ID you entered already exists. Type a different Logon ID and try again." on "registerPage"
  

  Examples:
    | emailaddress      | existingEmail                 | existingPassword | firstName | lastName |
    | bbbbireland@yopmail.com | parasireland@yopmail.com| Test1234         | sghsg     | ghdgdd   |


@automated @DEBD-1027 @DEBD-299
Scenario Outline: Navigate to Debenhams create account page and validate invalid email address scenario
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastName>" in "lastNamefield" on "registerPage"
  And I enter "<invalidEmail>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<existingPassword>" in "passwordField" on "loginPage"
  And I wait for "5000" milliseconds
  And I click on "createAccountButton" on "registerPage"
  Then I should see "emailCreateAccountForm" as "Enter a valid email address" on "registerPage"
  

  Examples:
    | emailaddress     | existingEmail | existingPassword | invalidEmail | firstName | lastName |
    | test2322@gmail.com | ffffff         | Test1234         | hdjd122222        | sghsg     | ghdgdd   |


@automated @DEBD-1027 @DEBD-299
Scenario Outline: Navigate to Debenhams create account section on login page and validate the error on providing email with incorrect format
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "emailCreateAccountForm" as "Enter a valid email address" on "registerPage"
  

  Examples:
    | email        | password |
    | <<<<<<222222 | hdjhd    |


@automated @DEBD-1027 @DEBD-299
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numerics
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastName>" in "lastNamefield" on "registerPage"
  And I enter "<emailaddress>" in "emailAddressFieldSignIn" on "loginPage"
  And I wait for "5000" milliseconds
  And I click on "createAccountButton" on "registerPage"
  Then I should see "passwordErrorTextMessage" as "The password field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastName | emailaddress |
    | Test      | User     | newnew@gmail.com |

@automated @DEBD-1027
Scenario: Navigate to Debenhams create account page and validate empty form filed validations
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "newgggg11@gmail.com" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "firstNameErrorTextMessage" as "The first name field cannot be empty" on "registerPage"
  Then I should see "lastNameErrorTextMessage" as "The last name field cannot be empty" on "registerPage"
  Then I should see "passwordErrorTextMessage" as "The password field cannot be empty" on "registerPage"
  
@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I enter "<firstname>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstname | lastname | password | emailaddress    |
    | Test      | User     | 11111111 | ghssg@gmail.com |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  And I enter "<firstname>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstname | lastname | password |
    | Test      | User     | @@@@@@@  |
    | Test      | User     | !@!$%^   |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  And I enter "<firstname>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstname | lastname | password |
    | Test      | User     | qqqwwwq  |
    | Test      | User     | qqqqqww  |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  And I wait for "3000" milliseconds
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password |
    | Test      | User     | pass     |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password |
    | Test      | User     | pass1    |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password |emailaddress|
    | Test      | User     | 1111     |ttest@gmail.com|

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate password info icons and check icon on valid password
  Given I navigate to "homeURL"
  When I logout
  And I click on "signInOptionDesktop" on "commonPage"
  When I click on "tab2" on "loginPage"
  And I enter "<emailaddress>" in "emailAddressField" on "registerPage"
  And I click on "createAccountButton" on "loginPage"
  And I wait for "3000" milliseconds
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I validate "class" of "sixCharacterStatus" as "info" on "registerPage"  
  And I validate "class" of "oneLetterStatus" as "info" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "info" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"

  Examples:
    | firstName | lastname | password   |   emailaddress  |
    | hjh      | User     | password2  | ttSSSSSSest@gmail.com |
  

@automated @DEBD-1027 @DEBD-1067
Scenario Outline: Navigate to Debenhams create account page and validate show hide functiality for password
  And I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  |
    | password2 |


@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate error message when user typed in more than three characters consecutively
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "errorTextMessage" as "Error:A character in your password occurs more consecutively than the allowed limit of 3. Please re-enter your password." on "registerPage"

  Examples:
    | firstName | lastname | password |
    | Test      | User     | aaaaaa1  |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate error message when email field is empty
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "" in "emailAddressFieldSignIn" on "loginPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  And I wait for "3000" milliseconds
  Then I should see "emailCreateAccountForm" as "The email address field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastname |
    | Test      | User     |

@automated @DEBD-1027
Scenario Outline: Navigate to Debenhams create account page and validate error message when email is incorrect
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  And I wait for "3000" milliseconds
  Then I should see "emailCreateAccountForm" as "Enter a valid email address" on "registerPage"

  Examples:
    | firstName | lastname | email |
    | Test      | User     | user2 |

@manual @DEBD-299 
Scenario: Validate UI of My Account - Create an account 
Given I navigate to "loginUrl"
When I click on "tab2" on "loginPage"
And  tab name will turn teal with a bold line above the tab name as per the screenshot
And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
Then its border will turn teal

@manual @DEBD-299
Scenario: Validate email should not trigger upon creating an account
Given I create an account
Then email should not be triggered


@manual @DEBD-1027
Scenario Outline: validate UI of Create Account Form
  Given I logout
  When I navigate to "loginUrl"
  And I click on "tab2" on "loginPage"
  When I enter invalid characters in First name
  Then I should see error message and box border should be in red
  When I enter invalid characters in Last name
  Then I should see error message and box border should be in red
  When I enter invalid characters in Email name
  Then I should see error message and box border should be in red
  When I enter invalid characters in Password
  Then I should see error message and box border should be in red

@manual @DEBD-1026
Scenario Outline: Validate rules in  password validation should update upon typing the characters
  Given I logout
  When I navigate to "loginUrl"
  And I click on "tab2" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressField" on "registerPage"
  And I enter password by one valid character as per rule
  And I should see Green ticks on the Passowrd validations



@automated @DEBD-1003
Scenario Outline: Navigate to Debenhams my account page and validate  subsicription not checked message
  Given I logout
  When I navigate to "loginUrl"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "myAccountLink" exist on "commonPage"
  And I click on "myAccountLink" on "commonPage"
  And I wait for "5000" milliseconds
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"

  Examples:
    | email                       | password   | newsletter_message  |
    | testautomationd77@gmail.com | password77 | No, please don't send me marketing communications |


@automated @DEBD-1003
Scenario Outline: Navigate to Debenhams my account page and validate  subsicription checked message
  Given I logout
  When I navigate to "loginUrl"
  And I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  And I wait for "5000" milliseconds
  And I should see "myAccountLink" exist on "commonPage"
  And I click on "myAccountLink" on "commonPage"
  And I wait for "5000" milliseconds
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"

  
  Examples:
    | email                       | password   | newsletter_message        |
    | testautomationd76@gmail.com | password76 | Yes, please send me marketing communications |


@manual @DEBD-1003
Scenario Outline: Navigate to Debenhams create account page and create an account with receive newsletters and validate the page of your new account
  When I click on "My Account" position "6"
  And I wait for "3000" milliseconds
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
    | email                      | password  | full_name     | newsletter_message                          |
    | testautomationd6@gmail.com | password6 | Mrs Test User | Yes, please send me marketing communications|



@manual @DEBD-1003
Scenario Outline: Navigate to Debenhams create account page and create an account without receive newsletters and validate the page of your new account
  Given I logout
  When I navigate to "loginUrl"
  And I click on "tab2" on "loginPage"
  When I enter "<emailaddress>" in "passwordField" on "registerPage"
  And I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressField" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  And I should see "headerText" as "Your new account" on "newUserPage"
  And I should see "registerCompleteText" as "Thank you for registering." on "newUserPage"
  And I should see "registerCompleteMessage" as "You have successfully created a Debenhams account and you are now logged in." on "newUserPage"
  And I should see "continueShoppingButton" exist on "newUserPage"
  When I click on "continueShoppingButton" on "newUserPage"
  Then I should not see "continueShoppingButton" on "newUserPage"

Examples:
    | email                      | password  | full_name     | newsletter_message                                |
    | testautomationd7@gmail.com | password7 | Mrs Test User | No, please don't send me marketing communications |