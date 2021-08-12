Feature: Test Debenhams create account page

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams login page and validate create an account title and header with email field as pre-filled
  Given I navigate to "loginUrl"
  # And I click on "countrySelectorpopupclose" on "commonPage" 
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  # Then I wait for "createAccountButton" element to be visible on "registerPage"
  # And I should see "titleOfPage" as "Register" on "registerPage"
  And I should see "headerText" as "Create an account" on "registerPage"
  Then I should see value of "emailAddressField" as "<email>" on "registerPage"

  Examples:
    | email                  |
    | testuserIE20@gmail.com |

@automated @DDAI-323 
Scenario Outline: Navigate to Debenhams create account page and validate the form
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I should see "headerText" as "Create an account" on "registerPage"
  And I should see "titlefield" exist on "registerPage"
  And I should see "firstNameField" exist on "registerPage"
  And I should see "lastNamefield" exist on "registerPage"
  And I should see "emailAddressField" exist on "registerPage"
  And I should see "passwordField" exist on "registerPage"
  And I should see "createAccountButton" exist on "registerPage"
  And I should see "receiveEmailCheckbox" exist on "registerPage"

  Examples:
    | email                |
    | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numerics
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  Then I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "passwordErrorTextMessage" as "The password field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastname | email                |
    | Test      | User     | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all numbers
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | 11111111 | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all speacial characters
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | @@@@@@@  | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with all letters
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | qqqqqww  | testuser21@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with less than six characters with only letters
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  And I wait for "3000" milliseconds
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "caution" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | pass     | testuser21@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with less than six characters with letters & number
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | pass1    | testuser22@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect password scenario with less than six characters with only numbers
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "caution" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"
  # And I should see "passwordErrorTextMessage" as "Incorrect password - Please check details and try again." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | 1111     | testuser22@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate password info icons and check icon on valid password
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  Then I validate "class" of "sixCharacterStatus" as "info" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "info" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "info" on "registerPage"
  When I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "class" of "sixCharacterStatus" as "check" on "registerPage"
  And I validate "class" of "oneLetterStatus" as "check" on "registerPage"
  And I validate "class" of "oneNumberStatus" as "check" on "registerPage"

  Examples:
    | password  | email                |
    | password2 | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate show hide functiality for password
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "text" on "loginPage"
  When I click on "showHideButton" on "loginPage"
  Then I validate "type" of "passwordFieldType" as "password" on "loginPage"

  Examples:
    | password  | email                |
    | password2 | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate form with no first name
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "firstNameErrorTextMessage" as "The first name field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastname | password  | email                |
    |           | User     | password1 | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate form with no last name
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "lastNameErrorTextMessage" as "The last name field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastname | password  | email                |
    | Test      |          | password1 | testuser20@gmail.com |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate incorrect message when user typed in existing customer
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressField" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "errorTextMessage" as "Error:The Logon ID you entered already exists. Type a different Logon ID and try again." on "registerPage"

  Examples:
    | firstName | lastname | email                 | password |
    | Test      | User     | er.sachin.p@gmail.com | Jan@2018 |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate error message when user typed in more than three characters consecutively
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<password>" in "passwordField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "errorTextMessage" as "Error:A character in your password occurs more consecutively than the allowed limit of 3. Please re-enter your password." on "registerPage"

  Examples:
    | firstName | lastname | password | email                |
    | Test      | User     | aaaaaa1  | testuser20@gmail.com |

@manual @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate error message when email field is empty
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "emailErrorTextMessage" as "The email address field cannot be empty" on "registerPage"

  Examples:
    | firstName | lastname | email |
    | Test      | User     |       |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and validate error message when email is incorrect
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
  And I enter "<lastname>" in "lastNamefield" on "registerPage"
  And I enter "<email>" in "emailAddressField" on "registerPage"
  And I am in view of "createAccountButton" on "registerPage"
  And I click on "createAccountButton" on "registerPage"
  Then I should see "emailErrorTextMessage" as "Enter a valid email address" on "registerPage"

  Examples:
    | firstName | lastname | email |
    | Test      | User     | user2 |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and create an account without receive newsletters and validate the page of your new account
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
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
    | firstName | lastname | email                        | password   |
    | Test      | User     | testautomationie68@gmail.com | password68 |

@automated @DDAI-323
Scenario Outline: Navigate to Debenhams my account page and validate it after creating new account from above scenario
  When I click on "menuIcon" on "commonPage"
  And I "validate & click" option is available in "mainMenuList" as "My Account" on "commonPage"
  #Then I should see value of position "6" as "My Account"
  #When I click on "My Account" position "6"
  And I wait for "3000" milliseconds
  Then I should see "headerText" as "My account" on "myDetailsPage"
  And I should see "fullName" as "<full_name>" on "myDetailsPage"
  And I should see "emailAddress" as "<email>" on "myDetailsPage"
  And I should see "editDetailsLinkROI" exist on "myDetailsPage"
  And I should see "managePasswordButton" exist on "myDetailsPage"
  And I should see "myAddressBookButton" exist on "myDetailsPage"
  And I should see "myPaymentCardsButton" exist on "myDetailsPage"
  And I should see "myOrderButton" exist on "myDetailsPage"
  And I should see "savedItemsButton" exist on "myDetailsPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "myDetailsPage"

  Examples:
    | email                        | full_name     | newsletter_message                                                                                           |
    | testautomationie68@gmail.com | Mrs Test User | Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions |


@automated @DDAI-323
Scenario Outline: Navigate to Debenhams create account page and create an account with receive newsletters and validate the page of your new account
  Given I logout
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage"
  And I am in view of "tab2" on "loginPage"
  When I click on "tab2" on "loginPage"
  And I enter "<email>" in "emailAddressFieldCreateAccount" on "loginPage"
  And I click on "createAccountButton" on "loginPage"
  When I enter "<firstName>" in "firstNameField" on "registerPage"
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
    | firstName | lastname | email                        | password   |
    | Test      | User     | testautomationie73@gmail.com | password73 |


@manual @DDAI-323
Scenario Outline: Navigate to Debenhams payment page and validate Newsletter preferences if customer selected "Yes" while creating account.	
  Given I navigate to "loginUrl"
  #And I click on "countrySelectorpopupclose" on "commonPage" 
  #Then I click on "countrySelectorpopupclose" on "commonPage"
  Then I am in view of "countrySelectorLink" on "commonPage"
  Then I click on "countrySelectorLink" on "commonPage"
  Then I should see "chooseyourcountry" as "Choose your country:" on "commonPage"
  Then I click on "countryAustralia" on "commonPage"
  Then I click on "countryselectorbtn" on "commonPage"
  #When I click on "tab1" on "loginPage"
  When I enter "<email>" in "emailAddressFieldSignIn" on "loginPage"
  And I enter "<password>" in "passwordField" on "loginPage"
  And I click on "signInButton" on "loginPage"
  Then I should not see "tab1" on "loginPage"
  And I should not see "tab2" on "loginPage"
  Then I navigate to pdp "perfume" and add to bag
  And I navigate to delivery options as already logged in with IE address
  Then I should see "headerText" as "Choose your delivery option" on "deliveryOptionPage"
  When I click on "standardOption" on "deliveryOptionPage"
  Then I should see "deliveryMessage" containing "Your order will arrive within" on "deliveryOptionPage"
  When I click on "proceedPaymentButton" on "deliveryOptionPage"
  And I wait for "2000" milliseconds
  Then I should see "headerText" as "Payment" on "paymentPage"
  And I should see "newsletterMessage" as "<newsletter_message>" on "Paymentpage"


  Examples:
    | email                       | full_name     | password   | newsletter_message                                                                                           |
    | testautomationd62@gmail.com | Mrs Test User | password62 | Yes, I would like to receive Debenhams email newsletters informing me of promotions, offers and competitions |
