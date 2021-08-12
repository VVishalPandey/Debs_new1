Feature: DSC - Account details page - Registered user search

@automated @DEBD-3309 
Scenario: Validate the Account details page when Debenhams service center user is logged in
  Given I logout
  And I am enacting as a guest using CCC
  And I should see "registeredcustomersearchheader" exist on "cccCustomerSearchPage"
  And I should see "firstnamefield" exist on "cccCustomerSearchPage"
  And I should see "Lastnamefield" exist on "cccCustomerSearchPage"
  And I should see "emailaddressfield" exist on "cccCustomerSearchPage"
  And I should see "phonenumberfield" exist on "cccCustomerSearchPage"
  And I should see "searchanywherewithinthefieldcheckbox" exist on "cccCustomerSearchPage"
  And I should see "searchCTA" exist on "cccCustomerSearchPage"
  And I should see "cccEmployeeNameLabel" exist on "cccCustomerSearchPage"
  And I should see "cccEmployeeName" exist on "cccCustomerSearchPage"
  And I should see "cccSignOutLink" exist on "cccCustomerSearchPage"
  And I should see "cccManagePasswordLink" exist on "cccCustomerSearchPage"
  Then I should not see "cccSignInButton" on "cccCustomerSearchPage"

@automated @DEBD-3309 
Scenario: Validate the page when Debenhams service center user is Signed out in
  Given I should not see "cccSignInButton" on "cccCustomerSearchPage"
  When I click on "cccSignOutLink" on "cccCustomerSearchPage"
  Then I should not see "cccSignOutLink" on "cccCustomerSearchPage"
  And I should see "cccSignInButton" exist on "cccCustomerSearchPage"

  

