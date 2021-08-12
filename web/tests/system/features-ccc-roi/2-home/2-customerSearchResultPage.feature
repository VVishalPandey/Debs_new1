Feature: DSC - Customer search results page

@automated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data
  Given I logout
  And I am enacting as a guest using CCC
  And I should see "registeredCustomerSearchTitle" exist on "cccCustomerSearchPage"
  And I should see "guestCustomerSearchTitle" exist on "cccCustomerSearchPage"
  When I enter "<firstname>" in "firstnamefield" on "cccCustomerSearchPage"
  And I enter "<lastname>" in "Lastnamefield" on "cccCustomerSearchPage"
  And I enter "<useremail>" in "emailaddressfield" on "cccCustomerSearchPage"
  And I enter "<phoneno>" in "phonenumberfield" on "cccCustomerSearchPage"
  And I click on "searchanywherewithinthefieldcheckbox" on "cccCustomerSearchPage"
  And I click on "searchCTA" on "cccCustomerSearchPage"
  And I should see "backToSearch" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTable" exist on "cccCustomerSearchPage"
  And I should see "selectResultRadioButton" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderEmail" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderFirstName" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderLastName" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderPhoneNo" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderPostCode" exist on "cccCustomerSearchPage"
  And I should see "searchResultsTableHeaderAddress" exist on "cccCustomerSearchPage"
  Then I should see "searchResultFirstName" containing "<firstname>" on "cccCustomerSearchPage"
  Then I should see "searchResultLastName" containing "<lastname>" on "cccCustomerSearchPage"
  Then I should see "searchResultPhoneNumber" containing "<phoneno>" on "cccCustomerSearchPage"
  Then I should see "searchResultPostCode" containing "<1stLineAddress>" on "cccCustomerSearchPage"
  Then I should see "searchResult1stLineAddress" containing "<Town>" on "cccCustomerSearchPage"

  Examples:
    |firstname | lastname | useremail  | phoneno    | 1stLineAddress  | Town         |
    |Balaji    | Ragh    | abc@123.com | 0123456789 | 123  | test|

@automated @DEBD-2287
Scenario: Validate back to search link on customer search result page
When I click on "backToSearch" on "cccCustomerSearchPage"
Then I should not see "Searchresulttable" on "cccCustomerSearchPage"
And I should see "cccDebsDotComTextLogo" exist on "cccCustomerSearchPage"
And I should see "registeredCustomerSearchTitle" exist on "cccCustomerSearchPage"
And I should see "guestCustomerSearchTitle" exist on "cccCustomerSearchPage"

@automated @DEBD-2287
Scenario Outline: Validate enact customer button behavior in Customer Search details page and drop session for the user
  And I enter "<useremail>" in "emailaddressfield" on "cccCustomerSearchPage"
  And I click on "searchCTA" on "cccCustomerSearchPage"
  And I click on "selectResultRadioButton" on "cccCustomerSearchPage"
  And I click on "enactCustomerButton" on "cccCustomerSearchPage"
  Then I should see "cccshopOnBehalfBanner" containing "You have enacted a Registered Customer's account" on "cccCustomerSearchPage"
  Then I should see "emailAddressMyAccount" containing "<useremail>" on "cccCustomerSearchPage"
  And I should see "dropCustomerSessionButton" exist on "cccCustomerSearchPage"
  And I click on "dropCustomerSessionButton" on "cccCustomerSearchPage"
  And I should see "registeredCustomerSearchTitle" exist on "cccCustomerSearchPage"
  And I should see "guestCustomerSearchTitle" exist on "cccCustomerSearchPage"

Examples:
    |useremail |
    |abc@123.com|

@automated @DEBD-2287
Scenario: Navigate to customer online ordering tool as a DSC user and sign out from the application
  Given I logout
  When I am enacting as a customer using DSC
  When I click on "dropCustomerSessionButton" on "cccCustomerSearchPage"
  And I click on "cccSignOutLink" on "cccCustomerSearchPage"
  Then I should not see "cccSignOutLink" on "cccCustomerSearchPage"
  And I should see "cccSignInButton" exist on "cccCustomerSearchPage"

@automated @DEBD-2287
Scenario: Navigate to customer online ordering tool as a DSC user and validate too many serach text
  Given I logout
  And I am enacting as a guest using CCC
  And I should see "registeredCustomerSearchTitle" exist on "cccCustomerSearchPage"
  And I should see "guestCustomerSearchTitle" exist on "cccCustomerSearchPage"
  And I click on "searchCTA" on "cccCustomerSearchPage"
  Then I should see "searchTooManyResultsText" containing "Search entry returned too many matches. Below is a partial list of results." on "cccCustomerSearchPage"
  And I click on "cccSignOutLink" on "cccCustomerSearchPage"
  Then I should not see "cccSignOutLink" on "cccCustomerSearchPage"
  And I should see "cccSignInButton" exist on "cccCustomerSearchPage"

@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [LastName only]
  Given I logout
  And I am enacting as a guest using CCC
  When I enter "<lastname>" in "firstNameField" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I should see "backtosearch" exist on "cccCustomerSearchPage"
  And I should see "Searchresulttable" exist on "cccCustomerSearchPage"
  And I should see "Selectcheckboxheading" exist on "cccCustomerSearchPage"
  And I should see "emailheading" exist on "cccCustomerSearchPage"
  And I should see "firstnameheading" exist on "cccCustomerSearchPage"
  And I should see "lastnameheading" exist on "cccCustomerSearchPage"
  And I should see "phonenumberheading" exist on "cccCustomerSearchPage"
  And I should see "postalcodeheading" exist on "cccCustomerSearchPage"
  And I should see "1stlineaddressheading" exist on "cccCustomerSearchPage"
  And I should see "lastnames" exist on "cccCustomerSearchPage"
  When I click on "backtosearch" on "cccCustomerSearchPage"
  Then I should not see "Searchresulttable" on "cccCustomerSearchPage"  


@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [phoneno only]
  Given I logout
  And I am enacting as a guest using CCC
  When I enter "<phoneno>" in "firstNameField" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I should see "backtosearch" exist on "cccCustomerSearchPage"
  And I should see "Searchresulttable" exist on "cccCustomerSearchPage"
  And I should see "Selectcheckboxheading" exist on "cccCustomerSearchPage"
  And I should see "emailheading" exist on "cccCustomerSearchPage"
  And I should see "firstnameheading" exist on "cccCustomerSearchPage"
  And I should see "lastnameheading" exist on "cccCustomerSearchPage"
  And I should see "phonenumberheading" exist on "cccCustomerSearchPage"
  And I should see "postalcodeheading" exist on "cccCustomerSearchPage"
  And I should see "1stlineaddressheading" exist on "cccCustomerSearchPage"
  And I should see "phoneno" exist on "cccCustomerSearchPage"
  When I click on "backtosearch" on "cccCustomerSearchPage"
  Then I should not see "Searchresulttable" on "cccCustomerSearchPage" 

@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [Phoneno only]
  Given I logout
  And I am enacting as a guest using CCC
  When I enter "<phoneno>" in "firstNameField" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I should see "backtosearch" exist on "cccCustomerSearchPage"
  And I should see "Searchresulttable" exist on "cccCustomerSearchPage"
  And I should see "Selectcheckboxheading" exist on "cccCustomerSearchPage"
  And I should see "emailheading" exist on "cccCustomerSearchPage"
  And I should see "firstnameheading" exist on "cccCustomerSearchPage"
  And I should see "lastnameheading" exist on "cccCustomerSearchPage"
  And I should see "phonenumberheading" exist on "cccCustomerSearchPage"
  And I should see "postalcodeheading" exist on "cccCustomerSearchPage"
  And I should see "1stlineaddressheading" exist on "cccCustomerSearchPage"
  And I should see "phoneno" exist on "cccCustomerSearchPage"
  When I click on "backtosearch" on "cccCustomerSearchPage"
  Then I should not see "Searchresulttable" on "cccCustomerSearchPage"     

@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [Email only]
  Given I logout
  And I am enacting as a guest using CCC
  When I enter "<email>" in "firstNameField" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I should see "backtosearch" exist on "cccCustomerSearchPage"
  And I should see "Searchresulttable" exist on "cccCustomerSearchPage"
  And I should see "Selectcheckboxheading" exist on "cccCustomerSearchPage"
  And I should see "emailheading" exist on "cccCustomerSearchPage"
  And I should see "firstnameheading" exist on "cccCustomerSearchPage"
  And I should see "lastnameheading" exist on "cccCustomerSearchPage"
  And I should see "phonenumberheading" exist on "cccCustomerSearchPage"
  And I should see "postalcodeheading" exist on "cccCustomerSearchPage"
  And I should see "1stlineaddressheading" exist on "cccCustomerSearchPage"
  And I should see "email" exist on "cccCustomerSearchPage"
  When I click on "backtosearch" on "cccCustomerSearchPage"
  Then I should not see "Searchresulttable" on "cccCustomerSearchPage"   

@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [Firstname only] and selects search anywhere in the fields checkbox
  Given I logout
  And I am enacting as a guest using CCC
  When I enter "<firstname>" in "firstNameField" on "cccCustomerSearchPage"
  And I click on "Searchanywherecheckobox" on "cccCustomerSearchPage"
  And I click on "Searchbutton" on "cccCustomerSearchPage"
  Then I should see "searchedtext" as "You have searched for [Field label] is [Field value]" on "cccCustomerSearchPage"
  And I should see "backtosearch" exist on "cccCustomerSearchPage"
  And I should see "Searchresulttable" exist on "cccCustomerSearchPage"
  And I should see "Selectcheckboxheading" exist on "cccCustomerSearchPage"
  And I should see "emailheading" exist on "cccCustomerSearchPage"
  And I should see "firstnameheading" exist on "cccCustomerSearchPage"
  And I should see "lastnameheading" exist on "cccCustomerSearchPage"
  And I should see "phonenumberheading" exist on "cccCustomerSearchPage"
  And I should see "postalcodeheading" exist on "cccCustomerSearchPage"
  And I should see "1stlineaddressheading" exist on "cccCustomerSearchPage"
  And I should see "firsttwoletter" exist on "cccCustomerSearchPage"
  

@notautomated @DEBD-2287
Scenario Outline: Validate the Search details page when Debenhams service center user enters valid data [Firstname only] and selects search anywhere in the fields checkbox and there are more than 10 search results
Then I should see "firsttwoletter" exist on "cccCustomerSearchPage"
Then I should see "errorsearchtext" as "Search entry returned too many matches. Below is a partial list of results." on "cccCustomerSearchPage"