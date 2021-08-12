Feature: DSC - 0 customer search results found

@automated @DEBD-2315
Scenario: Navigate to customer search page 
  Given I logout
  And I am enacting as a guest using CCC
  And I should see "registeredCustomerSearchTitle" exist on "cccCustomerSearchPage"
  And I should see "guestCustomerSearchTitle" exist on "cccCustomerSearchPage"

@automated @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user entered invalid [First Name / Last name / Email User / PhoneNumber] in the registered customer search page
  When I enter "<firstname>" in "firstnamefield" on "cccCustomerSearchPage"
  And I enter "<lastname>" in "Lastnamefield" on "cccCustomerSearchPage"
  And I enter "<useremail>" in "emailaddressfield" on "cccCustomerSearchPage"
  And I enter "<phoneno>" in "phonenumberfield" on "cccCustomerSearchPage"
  And I click on "searchCTA" on "cccCustomerSearchPage"
  Then I should see "noResultsError" containing "<error>" on "cccCustomerSearchPage"
  When I click on "backToSearch" on "cccCustomerSearchPage"
 
  Examples:
    | firstname | lastname | useremail | phoneno | error |
    |    testr        |     store card      |       anne.deegan@debenhams.com        |   1234567890       | No results found. Please retry. |
    |    new        |     store card      |       anne.deegan@debenhams.com        |   02075290701       | No results found. Please retry. |
    |    testr        |     new      |       anne.deegan@debenhams.com        |   02075290701       | No results found. Please retry. |
    |    testr        |     store card     |       djdhdj@djid.com       |   02075290701       | No results found. Please retry. |

@notautomated @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user entered invalid date [First Name] in the registered customer search page
  Given I navigate to "CESigninURL"
  When I enter "<email>" in "emailAddressFieldSignIn" on "CCLoginPage"
  And I enter "<password>" in "passwordField" on "CCLoginPage"
  And I click on "signInButton" on "CCLoginPage"
  Then I should not see "signInButton" on "accountdetailsPage"
  And I should see "signOutLink" exist on "accountdetailsPage"
  When I enter "<firstname>" in "firstNameField" on "accountdetailsPage"
  And I enter "<lasttname>" in "lastNamefield" on "accountdetailsPage"
  And I enter "<emailuser>" in "emailAddressFieldSignIn" on "accountdetailsPage"
  And I enter "<phoneno>" in "Phonenumberfield" on "accountdetailsPage"
  And I click on "Searchanywherecheckobox" on "accountdetailsPage"
  And I click on "Searchbutton" on "accountdetailsPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should see "backtosearch" exist on "NosearchresultPage"
  And I should see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"
 

  Examples:
    | email                       | password   | first name | lastname | emailuser | phone no |
    | test_automation11@gmail.com | password2  |           |          |           |           |

@notautomated @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user entered invalid date [Last Name] in the registered customer search page
  Given I navigate to "CESigninURL"
  When I enter "<email>" in "emailAddressFieldSignIn" on "CCLoginPage"
  And I enter "<password>" in "passwordField" on "CCLoginPage"
  And I click on "signInButton" on "CCLoginPage"
  Then I should not see "signInButton" on "accountdetailsPage"
  And I should see "signOutLink" exist on "accountdetailsPage"
  When I enter "<firstname>" in "firstNameField" on "accountdetailsPage"
  And I enter "<lasttname>" in "lastNamefield" on "accountdetailsPage"
  And I enter "<emailuser>" in "emailAddressFieldSignIn" on "accountdetailsPage"
  And I enter "<phoneno>" in "Phonenumberfield" on "accountdetailsPage"
  And I click on "Searchanywherecheckobox" on "accountdetailsPage"
  And I click on "Searchbutton" on "accountdetailsPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should see "backtosearch" exist on "NosearchresultPage"
  And I should see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"
 

  Examples:
    | email                       | password   | first name | lastname | emailuser | phone no |
    | test_automation11@gmail.com | password2  |           |          |           |           |

@notautomated  @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user entered invalid date [User email] in the registered customer search page
  Given I navigate to "CESigninURL"
  When I enter "<email>" in "emailAddressFieldSignIn" on "CCLoginPage"
  And I enter "<password>" in "passwordField" on "CCLoginPage"
  And I click on "signInButton" on "CCLoginPage"
  Then I should not see "signInButton" on "accountdetailsPage"
  And I should see "signOutLink" exist on "accountdetailsPage"
  When I enter "<firstname>" in "firstNameField" on "accountdetailsPage"
  And I enter "<lasttname>" in "lastNamefield" on "accountdetailsPage"
  And I enter "<useremail>" in "emailAddressFieldSignIn" on "accountdetailsPage"
  And I enter "<phoneno>" in "Phonenumberfield" on "accountdetailsPage"
  And I click on "Searchanywherecheckobox" on "accountdetailsPage"
  And I click on "Searchbutton" on "accountdetailsPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should see "backtosearch" exist on "NosearchresultPage"
  And I should see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"
 

  Examples:
    | email                       | password   | first name | lastname | useremail | phone no |
    | test_automation11@gmail.com | password2  |           |          |           |           |

@notautomated @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user entered invalid date [Phone no] in the registered customer search page
  Given I navigate to "CESigninURL"
  When I enter "<email>" in "emailAddressFieldSignIn" on "CCLoginPage"
  And I enter "<password>" in "passwordField" on "CCLoginPage"
  And I click on "signInButton" on "CCLoginPage"
  Then I should not see "signInButton" on "accountdetailsPage"
  And I should see "signOutLink" exist on "accountdetailsPage"
  When I enter "<firstname>" in "firstNameField" on "accountdetailsPage"
  And I enter "<lasttname>" in "lastNamefield" on "accountdetailsPage"
  And I enter "<emailuser>" in "emailAddressFieldSignIn" on "accountdetailsPage"
  And I enter "<phoneno>" in "Phonenumberfield" on "accountdetailsPage"
  And I click on "Searchanywherecheckobox" on "accountdetailsPage"
  And I click on "Searchbutton" on "accountdetailsPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should see "backtosearch" exist on "NosearchresultPage"
  And I should see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"
 

  Examples:
    | email                       | password   | first name | lastname | emailuser | phone no |
    | test_automation11@gmail.com | password2  |           |          |           |           |    

@notautomated @DEBD-2315
Scenario Outline: Validate the page when Debenhams service center user clicks on back to search link on zero customer search results page
  Given I navigate to "CESigninURL"
  When I enter "<email>" in "emailAddressFieldSignIn" on "CCLoginPage"
  And I enter "<password>" in "passwordField" on "CCLoginPage"
  And I click on "signInButton" on "CCLoginPage"
  Then I should not see "signInButton" on "accountdetailsPage"
  And I should see "signOutLink" exist on "accountdetailsPage"
  When I enter "<firstname>" in "firstNameField" on "accountdetailsPage"
  And I enter "<lasttname>" in "lastNamefield" on "accountdetailsPage"
  And I enter "<emailuser>" in "emailAddressFieldSignIn" on "accountdetailsPage"
  And I enter "<phoneno>" in "Phonenumberfield" on "accountdetailsPage"
  And I click on "Searchanywherecheckobox" on "accountdetailsPage"
  And I click on "Searchbutton" on "accountdetailsPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should see "backtosearch" exist on "NosearchresultPage"
  And I should see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"
  Then I click on "backtosearchlink" on "NosearchresultPage" 
  And I should see "Firstnamefield" exist on "AccountPage"
  And I should see "Lastnamefield" exist on "AccountPage"
  And I should see "Emailaddressfield" exist on "AccountPage"
  And I should see "Phonenumberfield" exist on "AccountPage"
  And I should not see "searchedtext" as "You have searched for [Field label] is [Field value]" on "NosearchresultPage"
  And I should not see "backtosearch" on "NosearchresultPage"
  And I should not see "Noresulttext" as "No results found. Please try again" on "NosearchresultPage"

  Examples:
    | email                       | password   | first name | lastname | emailuser | phone no |
    | test_automation11@gmail.com | password2  |           |          |           |           | 

