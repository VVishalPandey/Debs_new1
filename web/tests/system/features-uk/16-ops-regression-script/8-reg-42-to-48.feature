Feature: Test Debenhams Regression scenarios 42 to 48

@automated @ops-UK @MyAccount @Sno.-42
Scenario Outline: Navigate to Debenhams my details page and validate details of user
  Given I logout
  Then I navigate to "loginUrl"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"
  And I store the "newsletterMessage" displayed on "myDetailsPage"

  Examples:
    | email               | password |
    | testrm2@debs.com   | password2|

@automated @ops-UK @MyAccount @Sno.-42
Scenario: Navigate to Debenhams edit details page under my account and validate the user information is displayed to user
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I should see "editDetailsPageTitle" as "Change my details" on "myDetailsPage"
  And I validate "firstName" is editable on "myDetailsPage"
  And I validate "lastName" is editable on "myDetailsPage"
  And I validate "emailAddressInput" is editable on "myDetailsPage"
  And I validate "dateOfBirthInput" is editable on "myDetailsPage"
  And I should see "newsletterSubscriptionCheckbox" exist on "myDetailsPage"
  And I should see "saveChangesButton" exist on "myDetailsPage"

@automated @ops-UK @MyAccount @Sno.-42
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

@automated @ops-UK @MyAccount @Sno.-42
Scenario: Navigate to Debenhams edit details page under my account and validate the back button functionality
  Then I click on "editDetailsButton" on "myDetailsPage"
  And I click on "backNavigationButton" on "myDetailsPage"
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "editDetailsButton" exist on "myDetailsPage"

@automated @ops-UK @MyAccount @Sno.-46
Scenario: Navigate to Debenhams login page and validate create an account title and header with email field as pre-filled
  Given I logout
  Then I navigate to "loginUrl"
  When I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  Then I enter email in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  #Then I should see value of "emailAddressField" as "<email>" on "registerPage"

@automated @ops-UK @MyAccount @Sno.-46
Scenario: Navigate to Debenhams create account page and validate the form
  Then I should see "headerText" as "Create an account" on "registerPage"
  And I should see "titlefield" exist on "registerPage"
  And I should see "firstNameField" exist on "registerPage"
  And I should see "lastNamefield" exist on "registerPage"
  And I should see "emailAddressField" exist on "registerPage"
  And I should see "passwordField" exist on "registerPage"
  And I should see "createAccountButton" exist on "registerPage"
  And I should see "receiveEmailCheckbox" exist on "registerPage"

@automated @ops-UK @MyAccount @Sno.-46
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

@automated @ops-UK @MyAccount @Sno.-47
Scenario Outline: Sign into beauty club card section with user having linked card and validate if login and page after login is as expected
  Given I logout
  When I click on "menuIcon" on "commonPage"
  And I should see value of position "14" as "Create Account/Sign In"
  And I should see value of position "15" as "Saved Items"
  And I should see value of position "16" as "Store Finder"
  And I should see value of position "17" as "My Beauty Club"
  And I should see value of position "18" as "Help & Support"
  And I should see value of position "19" as "Personal finance"
  When I click on "My Beauty Club" position "17"
  Then I should see "headerTitleText" as "Join Beauty Club" on "beautyClubPage"
  And I should see "headerSubTitleText" as "To join Beauty Club or to link your card to your account, please sign in or create a Debenhams.com account" on "beautyClubPage"
  And I should see "tab1" as "Sign In" on "beautyClubPage"
  And I should see "tab2" as "Create an account" on "beautyClubPage"
  When I click on "tab1" on "beautyClubPage"
  And I enter "<email>" in "emailAddressFieldSignIn" on "beautyClubPage"
  And I enter "<password>" in "passwordField" on "beautyClubPage"
  And I click on "signInButton" on "beautyClubPage"
  #And I wait for "3000" milliseconds
  Then I should see "headerTitleText" as "<signedInHeaderTitle>" on "beautyClubPage"
  And I should see "headerSubTitleText" as "Welcome to your Beauty Club Account" on "beautyClubPage"
  And I should see "dashboardTab1" as "My points" on "beautyClubPage"
  And I should see "dashboardTab2" as "My rewards" on "beautyClubPage"
  And I should see "beautyPoints" exist on "beautyClubPage"
  And I should not see "noCardLinkedHeaderText" on "beautyClubPage"
  And I should not see "noCardLinkedText" on "beautyClubPage"
  And I should not see "linkCardButton" on "beautyClubPage"

  Examples:
    | email                      | password  | signedInHeaderTitle |
    | testautomationd3@gmail.com | password3 | Hello Test         |    

@automated @ops-UK @MyAccount @Sno.-48
Scenario Outline: Navigate to Debenhams My account page and Add new card in Beauty Club
  Given I logout
  Then I navigate to "loginUrl"
  When I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  Then I enter email in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "continueShoppingButton" exist on "newUserPage"
  And I click on "continueShoppingButton" on "newUserPage"
  #Then I should see "headerText" as "My account" on "myDetailsPage"

  Examples:
    | firstName | lastname | password  |
    | Test      | User     | password2 |

@automated @ops-UK @MyAccount @Sno.-48
Scenario: Verify that a new Beauty Club card is added successfully to the account
  Then I click on "menuIcon" on "commonPage"
  And I click on "My Account" position "14"
  Then I should see "myBeautyClubLink" exist on "myAccountPage"
  And I click on "myBeautyClubLink" on "myAccountPage"
  Then I should see "addNewBeautyCardLink" exist on "beautyClubPage"
  And I click on "addNewBeautyCardLink" on "beautyClubPage"
  Then I should see "dontHaveBeautyClubCardRadio" exist on "beautyClubPage"
  Then I should see "dOBInputfield" exist on "beautyClubPage"    