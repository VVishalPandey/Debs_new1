Feature: Test Debenhams Regression scenarios 42 to 46

@automated @ops-ROI @MyAccount @Sno.-42
Scenario: Navigate to Debenhams my details page and validate details of user
Given I logout
  Then I navigate to "loginUrl"
  When I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  Then I enter email in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I should see "headerText" as "Create an account" on "registerPage"

@automated @ops-ROI @MyAccount @Sno.-42
Scenario Outline: Navigate to Debenhams create account page and validate correct password scenario
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  
  Examples:
    | firstName | lastname | password  |
    | Test      | User     | password2 |

@automated @ops-ROI @MyAccount @Sno.-42
Scenario: Naviagte to My account and validate the edit details link is present
  When I click on "menuIcon" on "commonPage"
  When I click on "My Account" position "14"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I store the "newsletterMessage" displayed on "myDetailsPage"    

@automated @ops-ROI @MyAccount @Sno.-42
Scenario: Navigate to Debenhams edit details page under my account and validate the user information is displayed to user
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I should see "editDetailsPageTitle" as "Change my details" on "myDetailsPage"
  And I validate "firstName" is editable on "myDetailsPage"
  And I validate "lastName" is editable on "myDetailsPage"
  And I validate "emailAddressInput" is editable on "myDetailsPage"
  And I validate "dateOfBirthInput" is editable on "myDetailsPage"
  And I should see "newsletterSubscriptionCheckbox" exist on "myDetailsPage"
  And I should see "saveChangesButton" exist on "myDetailsPage"

@automated @ops-ROI @MyAccount @Sno.-42
Scenario Outline: Navigate to Debenhams edit details page under my account and validate the user information can be updated
  Then I enter "<first_name>" in "firstName" on "myDetailsPage"
  And I enter "<last_name>" in "lastName" on "myDetailsPage"
  And I click on "newsletterSubscriptionCheckbox" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I verify that "newsletterMessage" is updated on "myDetailsPage"
  Then I click on "editDetailsButton" on "myDetailsPage"
  Then I enter "<first_name1>" in "firstName" on "myDetailsPage"
  And I enter "<last_name1>" in "lastName" on "myDetailsPage"
  And I click on "saveChangesButton" on "myDetailsPage"
  Then I should see "fullName" as "<full_name1>" on "myDetailsPage"
  
  Examples:
    | first_name  | last_name |full_name     |   first_name1  | last_name1 |full_name1   |
    | Test        | Debs      | Mrs Test Debs| DebsT          | Test      | Mrs DebsT Test |

@automated @ops-ROI @MyAccount @Sno.-42
Scenario: Navigate to Debenhams edit details page under my account and validate the back button functionality
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I click on "backNavigationButton" on "myDetailsPage"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"

@automated @ops-ROI @MyAccount @Sno.-46
Scenario: Navigate to Debenhams login page and validate create an account title and header with email field as pre-filled
  Given I logout
  Then I navigate to "loginUrl"
  When I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  Then I enter email in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  #Then I should see value of "emailAddressField" as "<email>" on "registerPage"

@automated @ops-ROI @MyAccount @Sno.-46
Scenario: Navigate to Debenhams create account page and validate the form
  Then I should see "headerText" as "Create an account" on "registerPage"
  And I should see "titlefield" exist on "registerPage"
  And I should see "firstNameField" exist on "registerPage"
  And I should see "lastNamefield" exist on "registerPage"
  And I should see "emailAddressField" exist on "registerPage"
  And I should see "passwordField" exist on "registerPage"
  And I should see "createAccountButton" exist on "registerPage"
  And I should see "receiveEmailCheckbox" exist on "registerPage"

@automated @ops-ROI @MyAccount @Sno.-46
Scenario Outline: Navigate to Debenhams create account page and validate correct password scenario
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  # And I wait for "9000" milliseconds
  # Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  # And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  # And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  Then I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  
  Examples:
    | firstName | lastname | password  |
    | Test      | User     | password2 |
