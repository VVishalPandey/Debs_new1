Feature: Test Debenhams hygiene page weak connection


@manual @DEBD-191
Scenario: Validate weak connection hygiene page when there is no internet connection
 Given I navigate to "homePage"
 When I lose my internet connection completely
 And I navigate to "dressPdpUrl"
 And I should see "weakConnectionImage" on "weakConnectionBanner"
 And I should see "weakConnectionText" on "weakConnectionBanner"
 And I should see "retryButton" on "weakConnectionBanner"

@manual @DEBD-191
Scenario: Validate the behavior when clicked on Retry connection button in weak connection page
 Given I am on the weak connection Page
 And I should see "retryButton" on "weakConnectionBanner"
 And I click on "retryButton" on "weakConnectionBanner"
 Then the device I am on will try to re-connection
 And I should see Debenhams Loader icon

@manual @DEBD-191
Scenario: Validate the behavior when clicked on Retry connection and internet connection is recovered
 Given I am on the weak connection Page
 And I click on "retryButton" on "weakConnectionBanner"
 And Internet connection is recovered
 And I should be able to navigate to all the pages without any offline notiifcation


 
 




