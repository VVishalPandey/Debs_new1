Feature: Test Debenhams hygiene page for generic 404 error page


@manual @DEBD-1025
Scenario: Validate generic error page for 404 error notification when you manipulate the url 
 Given I navigate to "testDressPdpURL"
 And I manipulate the URL with invalid characters
 And hit the enter
 And I should see generic error page


@manual @DEBD-1025
Scenario: Validate components and functionality of generic error page for 404 error
 Given I navigate to "testDressPdpURL"
 And I manipulate the URL with invalid characters
 And hit the enter
 And I should see generic error page
 When I am on a generic error page
 And I should see "headerText404" as "Oh no, we can't find that page" on "genericErrorPage"
 And I should see "copyText404" contains "Why not retyping the address or browse one of your departments" on "genericErrorPage"
 And I should see "copyBoldText" as "Thankyou for your patience" on "genericErrorPage"
 And I should see "toolImage" exist on "genericErrorPage"
 And I should see "categryLinks" exist on "genericErrorPage"
 And I should not see "continueShoppingButton" on "genericErrorPage"


@manual @DEBD-1025
Scenario: Validate category links in the generic 404 error page
 Given I navigate to "testDressPdpURL"
 And I manipulate the URL with invalid characters
 And I hit the enter
 And I should see generic error page